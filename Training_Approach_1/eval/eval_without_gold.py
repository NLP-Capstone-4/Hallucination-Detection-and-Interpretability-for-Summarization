# -*- coding: utf-8 -*-
"""
Created on Thu Oct 26 05:48:03 2023

@author: devav
"""
import csv
from datasets import load_dataset
from transformers import AutoTokenizer
from transformers import AutoModelForTokenClassification
import evaluate
import numpy as np
import torch

SEP_TOKEN = "<SEP>"
EOS_TOKEN = "<EOS>"
punctuations = ['!',',','.','?',":",";"]

'''
    Get label names from the dataset features and generate id to label and label to id lookup dictionaries
'''
def get_label_dicts(ds):
    label_list = ds["train"].features[f"tags"].feature.names
    id2label = {}
    label2id = {}

    for i in range(len(label_list)):
        id2label[i] = label_list[i]
        label2id[label_list[i]] = i
        
    return id2label, label2id

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
    encode source tokens using model's tokenizer. 
    Returns:
        1: Tokenized inputs (containing input_ids and attention_mask)
        3: Start of Summary index in source (After <SEP> token)
        4: End of Summary index in source (Before <EOS> token)
'''
def tokenize(source_tokens):
    tokenized_inputs = tokenizer([source_tokens], truncation=False, is_split_into_words=True, return_tensors='pt').to(device)
    return tokenized_inputs, source_tokens.index(SEP_TOKEN)


'''
    Predict using model.
    Input: (output of tokenize(source_tokens))
        1: Tokenized inputs (containing input_ids and attention_mask)
        2: Source token count
        3: Start of Summary index in source (After <SEP> token)
        4: End of Summary index in source (Before <EOS> token)
    Output:
        1: Prediction labels of entire source
        2: Prediction labels of summary segment from source
'''
def predict(tokenized_inputs, sep_idx):
    output = model(**tokenized_inputs) # predict
    
    # argmax predictions to get prediction label indices
    output = output.logits.cpu().detach().tolist()
    predictions = np.argmax(output, axis=2)
    
    # get prediciton lables by ignoring [SEP], [CLS] and sub-word tokens
    prediction_labels = []
    for i in range(len(predictions)):
        word_ids = tokenized_inputs.word_ids(batch_index=0)
        
        previous_word_id = None
        record_prediction_labels = []
        
        for word_id_idx in range(len(word_ids)):
           word_id = word_ids[word_id_idx]
           if word_id != previous_word_id and word_id is not None: # consider word index if not [SEP], [CLS] and sub-word token
               record_prediction_labels.append(id2label[predictions[i][word_id_idx]])
           previous_word_id = word_id
        prediction_labels.append(record_prediction_labels)
        
    
    source_prediction_labels = prediction_labels[0] # There is only 1 record hence 0th one is prediction for entire source
    summary_prediction_labels = source_prediction_labels[sep_idx+1:] #slice prediction for summary segment from source
    
    return source_prediction_labels, summary_prediction_labels


'''
    Function to get source and summary predictions by taking dialog and summary as input
'''
def predict_dialog_summary(dialog, summary):
    
    # Generate Source = DIALOG + <SEP> + SUMMARY + <EOS>
    source = curate_text(dialog) + f' {SEP_TOKEN} ' + curate_text(summary) + f' {EOS_TOKEN} '
    source_tokens = source.split()  # whilte space tokenize source
    
    tokenized_inputs, sep_idx = tokenize(source_tokens) #encode tokens using model's tokenizer
    
    #get source and summary prediction using the encoded tokenized data
    source_prediction_labels, summary_prediction_labels = predict(tokenized_inputs, sep_idx)
    
    
    dialog = ' '.join(source_tokens[0:sep_idx])
    generated_summary_tokens = source_tokens[sep_idx+1:]
    print(f'Length of Source: {len(source_tokens)}, Length of summary: {len(generated_summary_tokens)}, Length of Source Predictions: {len(source_prediction_labels)}, Length of Summary Predictions: {len(summary_prediction_labels)} Predictions: {" ".join(summary_prediction_labels)}')


'''
    Test function for predicting using dialog and summary
'''
def test_predict_dialog_summary():
    dialog = "Augustine : Guys , remember it's Wharton's bday next week ? Darlene : yay , a party ! Heather : yay ! crap we need to buy him a present Walker : he mentioned paper shredder once Augustine : wtf ? ! ? Walker : he did really . for no reason at all . Heather : whatever that make him happy Darlene : cool with me . we can shred some papers at the party Augustine : so much fun Heather : srsly guys , you mean we should really get office equipment ? ? ? Darlene : Walk , ask him if he really wnts it and if he yes then we get it Walker : i heard him say that . wasn ; t drunk . me neither . Darlene : but better ask him twice Walker : will do Augustine : 2moro ok ? Darlene : and sure ask ab the party !"
    summary = "It's Wharton's birthday next week . Darlene , Walker and Heather are going to buy him a present . They will ask him if he really wants a paper shredder ."

    #dialog = "Gloria : This exam is a bit of a lottery in fact Gloria : You can't really get prepared , it's all about experience Emma : But there are some rules and some typical texts right ? Gloria : You can see some texts from previous years Gloria : <file_other> Emma : Wow that's very useful Emma : I have never seen this site Gloria : Yes it's very good Gloria : Actually it's good to read all the texts because you will see that some phrases repeat very often Emma : How much time do you have for all 4 parts ? Gloria : 4 hours Emma : Is it enough ? Gloria : Well it has to be Gloria : Would be perfect to have 2 more hours . . . But on the other hand it would be really exhausting Emma : 4 hours and no breaks ? Gloria : No breaks : / So it's really important to be really focused and try to write as fast as you can Gloria : And read it carefully and correct during the last hour Emma : I'm going to read everything from that website , it's great"
    #summary = "Gloria sends Emma a website with information about the exam . The exam is 4 hours long with no breaks ."

    #dialog = "Ernest : hey Mike , did you park your car on our street ? Mike : no , took it into garage today Ernest : ok good Mike : why ? Ernest : someone just crashed into a red honda looking just like yours Mike : lol lucky me"
    #summary= "Mike's car has been damaged beyond repair after being hit by another car ."
    
    predict_dialog_summary(dialog, summary)  # predict source
    
'''
    test function for predicting using dataset having source field data
'''  
def test_predict_dataset(ds, filename):
    outputs = []
    predictions_labels = []
    
    for i in range(len(ds['source'])):
        source_tokens = ds['source'][i] # get source tokens from dataset for ith record
        
        tokenized_inputs, sep_idx = tokenize(source_tokens) #encode tokens using model's tokenizer
        
        #get source and summary prediction using the encoded tokenized data
        source_prediction_labels, summary_prediction_labels = predict(tokenized_inputs, sep_idx)
            
        # get dialog, summary, gold tags and prediction tag texts for printing to csv file
        gold_tags_tokens = ds['tags'][i]
        
        dialog = ' '.join(source_tokens[0:sep_idx])
        generated_summary_tokens = source_tokens[sep_idx+1:]
        generated_summary = ' '.join(generated_summary_tokens)
        
        gold_tag_ids = gold_tags_tokens[sep_idx+1:]
        gold_tag_labels = [id2label[id] for id in gold_tag_ids]
        
        gold_tags = ' '.join(gold_tag_labels)
        summary_pred_tags = ' '.join(summary_prediction_labels)
        
        outputs.append({
                        'source': ' '.join(source_tokens),
                        'Source token Count': len(gold_tags_tokens),
                        
                        'dialog':dialog, 
                        'Generated Summary': generated_summary, 
                        'Generated Summary token count': len(generated_summary_tokens),
                        'Gold Tags': gold_tags, 
                        'Gold tags Count': len(gold_tag_labels),
                        'Summary Prediction Tags': summary_pred_tags,
                        'Summary Prediction tags Count': len(summary_prediction_labels),
                        'Total Prediction token Count': len(source_prediction_labels),
                        'match':gold_tags == summary_pred_tags
                        })
        
    keys = outputs[0].keys()

    with open(filename, 'w', newline='', encoding="utf-8") as output_file:
        dict_writer = csv.DictWriter(output_file, keys)
        dict_writer.writeheader()
        dict_writer.writerows(outputs)

device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')

# load trained tokenizer and model from huggingface
tokenizer = AutoTokenizer.from_pretrained('Deojoandco/capstone_hal_without_gold', add_prefix_space=True)
model = AutoModelForTokenClassification.from_pretrained('Deojoandco/capstone_hal_without_gold').to(device)

# load dataset
ds = load_dataset("Deojoandco/capstone_hal_without_gold")
id2label, label2id = get_label_dicts(ds)    # get id2label and label2id dictionary

test_predict_dialog_summary()   # test with dialog and summary

#test with dataset splits
print('Predicting train dataset...')
test_predict_dataset(ds['train'], 'prediction_output_wihtoutgold_train.csv')
print('Predicting validation dataset...')
test_predict_dataset(ds['validation'], 'prediction_output_withoutgold_validation.csv')
print('Predicting test dataset...')
test_predict_dataset(ds['test'], 'prediction_output_withoutgold_test.csv')