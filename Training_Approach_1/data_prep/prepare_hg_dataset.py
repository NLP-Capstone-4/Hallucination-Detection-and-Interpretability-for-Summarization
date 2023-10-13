#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Oct  9 14:08:22 2023

@author: ninaadj
"""

import pandas as pd
import datasets
import numpy as np
from sklearn.model_selection import train_test_split

FROM = 500

SEP_TOKEN = " <SEP> "
EOS_TOKEN = " <EOS>"
punctuations = ['!',',','.','?',":",";"]

def curate_text(text):
    curated_text = ''
    if type(text) == str:
        text = text.replace('\n',' ')
        for punctuation in punctuations:
            text = text.replace(punctuation, ' ' + punctuation + ' ')
        
        curated_text = " ".join(text.split())
    return curated_text
    

def create_source(row):
    source = row['Dialogue'] + SEP_TOKEN + row['Generated Summary'] + EOS_TOKEN
    return source.split()

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


def split_stratified_into_train_val_test(df_input, frac_train=0.8, frac_val=0.1, frac_test=0.10):
    if frac_train + frac_val + frac_test != 1.0:
        raise ValueError('fractions %f, %f, %f do not add up to 1.0' % \
                         (frac_train, frac_val, frac_test))

    # Split original dataframe into train and temp dataframes.
    df_train, df_temp = train_test_split(df_input, test_size=(1.0 - frac_train), random_state=42, shuffle=True)

    
    # Split the temp dataframe into val and test dataframes.
    relative_frac_test = frac_test / (frac_val + frac_test)
    df_val, df_test = train_test_split(df_temp, test_size = relative_frac_test, random_state=42, shuffle=True)
    
    assert len(df_input) == len(df_train) + len(df_val) + len(df_test)
    
    df_train.reset_index(drop=True, inplace = True)
    df_val.reset_index(drop=True, inplace = True)
    df_test.reset_index(drop=True, inplace = True)

    return df_train, df_val, df_test

df = pd.read_excel('annotated_capstone_data.xlsx')

df = df.iloc[FROM:]

df['Dialogue'] = df['Dialogue'].apply(curate_text)
#df['Reference Summary'] = df['Reference Summary'].apply(curate_text)
df['Generated Summary'] = df['Generated Summary'].apply(curate_text)
df['Annotations'] = df['Annotations'].apply(curate_text)

df['source'] = df.apply(create_source, axis = 1)
df['tags'] = df.apply(create_tags, axis = 1)

tag_labels = np.unique(df['tags'].sum()).tolist()
tagLabels = datasets.ClassLabel(num_classes=len(tag_labels), names=tag_labels)

df['tag_ids'] = df['tags'].apply(map_tag_ids)

ds_features = datasets.Features({
    'source': datasets.Sequence(feature=datasets.Value(dtype='string', id=None), length=-1, id=None), 
    'tags': datasets.Sequence(feature=tagLabels, length=-1, id=None)
})
print(ds_features)

dataset_df = pd.DataFrame()
dataset_df['source'] = df['source']
dataset_df['tags'] = df['tag_ids']

df_train, df_val, df_test = split_stratified_into_train_val_test(dataset_df)

train_ds = datasets.Dataset.from_pandas(df_train, features=ds_features, split='train')
val_ds = datasets.Dataset.from_pandas(df_val, features=ds_features, split='validation')
test_ds = datasets.Dataset.from_pandas(df_test, features=ds_features, split='test')

'''
train_ds.to_json(f"./capstone_ds/train.jsonl", orient="records", lines=True)
val_ds.to_json(f"./capstone_ds/validation.jsonl", orient="records", lines=True)
test_ds.to_json(f"./capstone_ds/test.jsonl", orient="records", lines=True)

ds = datasets.load_dataset('capstone_ds')
'''
print(train_ds)
print(val_ds)
print(test_ds)

print("Uploading to Huggingface")
#ds.push_to_hub('capstone_hal', token ='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')
train_ds.push_to_hub('capstone_hal', token ='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')
val_ds.push_to_hub('capstone_hal', token ='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')
test_ds.push_to_hub('capstone_hal', token ='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')