#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Oct  9 14:08:22 2023

@author: deo
"""

import pandas as pd
import datasets
import numpy as np
from sklearn.model_selection import train_test_split

# select records as required
FROM = 500
TO = None

SEP_TOKEN = "<SEP>"
EOS_TOKEN = "<EOS>"
punctuations = ['!',',','.','?',":",";"]

'''
    Curate text by:
        1: removing \n 
        2: Putting spaces before and after the punctions defined in the punctuations list above
'''
def curate_text(text):
    curated_text = ''
    if type(text) == str:
        text = text.replace('\n',' ')
        for punctuation in punctuations:
            text = text.replace(punctuation, ' ' + punctuation + ' ')
        
        curated_text = " ".join(text.split())
    return curated_text
    
'''
    # Generate Source = DIALOG + <SEP> + SUMMARY + <EOS>
    returns source tokens
'''
def create_source(row):
    source = row['Dialogue'] + f' {SEP_TOKEN } ' + row['Generated Summary'] + f' {EOS_TOKEN}'
    return source.split()

'''
    creates O tags for DIALOG + <SEP>
    appends annotations to this
    and returns tags for entire source
'''
def create_tags(row):
    source_token_count = len(row['source'])
    tags = ['O'] * (source_token_count)
    
    annotation_tokens = row['Annotations'].split()
    
    annotation_start_idx = (len(tags) - len(annotation_tokens))
    for i in range(len(annotation_tokens)):
        tags[annotation_start_idx + i] = annotation_tokens[i]
        
    return tags

def token_count(tokens):
    return len(tokens)


def map_tag_ids(tags):
    return tagLabels.str2int(tags)


def assign_dialog_id(dialogue):
    return dialog_ids[dialogue]


'''
    split using unique dialog_ids across train, validation and test 
    
'''
def split_stratified_into_train_val_test_byid(df_input, dialog_ids, frac_train=0.8, frac_val=0.1, frac_test=0.10):
    if frac_train + frac_val + frac_test != 1.0:
        raise ValueError('fractions %f, %f, %f do not add up to 1.0' % \
                         (frac_train, frac_val, frac_test))

    # Split dialogids into train and temp dataframes.
    df_train_ids, df_temp_ids = train_test_split(dialog_ids, test_size=(1.0 - frac_train), random_state=42, shuffle=True)

    
    # Split the temp dialogids into val and test dialogids.
    relative_frac_test = frac_test / (frac_val + frac_test)
    df_val_ids, df_test_ids = train_test_split(df_temp_ids, test_size = relative_frac_test, random_state=42, shuffle=True)
    

    # create train dataset using split train dialog ids
    df_train = df_input[df_input['dialog_id'].isin(df_train_ids)]
    df_train.reset_index(drop=True, inplace = True)
    
    # create val dataset using split train dialog ids
    df_val = df_input[df_input['dialog_id'].isin(df_val_ids)]
    df_val.reset_index(drop=True, inplace = True)
    
    # create test dataset using split train dialog ids
    df_test = df_input[df_input['dialog_id'].isin(df_test_ids)]
    df_test.reset_index(drop=True, inplace = True)
    

    return df_train, df_val, df_test

# load annotated xlsx in pandas
df = pd.read_excel('annotated_capstone_data.xlsx')

# select records are required
df = df.iloc[FROM:TO]

# curate dialog texts and generate unique dialog ids
df['Dialogue'] = df['Dialogue'].apply(curate_text)
unique_dialogues = df.Dialogue.fillna('[]').value_counts().index.tolist()
dialog_ids = {}
for i in range(len(unique_dialogues)):
    dialog_ids[unique_dialogues[i]] = i
df['dialog_id'] = df['Dialogue'].apply(assign_dialog_id)


# curate Generated Summary and Annoations
df['Generated Summary'] = df['Generated Summary'].apply(curate_text)
df['Annotations'] = df['Annotations'].apply(curate_text)

# create source and tags for source using annotations
df['source'] = df.apply(create_source, axis = 1)
df['tags'] = df.apply(create_tags, axis = 1)

# get unique list of tag labels
tag_labels = np.unique(df['tags'].sum()).tolist()

# create dataset feature from taglabels
tagLabels = datasets.ClassLabel(num_classes=len(tag_labels), names=tag_labels)

#convert tag labels to tag ids
df['tag_ids'] = df['tags'].apply(map_tag_ids)

# define dataset features
ds_features = datasets.Features({
    'dialog_id': datasets.Value(dtype='int32', id=None),
    'source': datasets.Sequence(feature=datasets.Value(dtype='string', id=None), length=-1, id=None), 
    'tags': datasets.Sequence(feature=tagLabels, length=-1, id=None)
})

# create target dataset using dialog_id, source and tags
dataset_df = pd.DataFrame()
dataset_df['dialog_id']= df['dialog_id']
dataset_df['source'] = df['source']
dataset_df['tags'] = df['tag_ids']

# split dataset using unique dialogids
df_train, df_val, df_test = split_stratified_into_train_val_test_byid(dataset_df, list(dialog_ids.values()))

# convert pandas dataframe to huggingface dataset with split information
train_ds = datasets.Dataset.from_pandas(df_train, features=ds_features, split='train')
val_ds = datasets.Dataset.from_pandas(df_val, features=ds_features, split='validation')
test_ds = datasets.Dataset.from_pandas(df_test, features=ds_features, split='test')

# push splits to huggingface repo
print("Uploading to Huggingface")
train_ds.push_to_hub('capstone_hal_without_gold', token ='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')
val_ds.push_to_hub('capstone_hal_without_gold', token ='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')
test_ds.push_to_hub('capstone_hal_without_gold', token ='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')