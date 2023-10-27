#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Oct 10 14:51:19 2023

@author: deo
"""
from datasets import load_dataset
from transformers import AutoTokenizer
import numpy as np
import evaluate
from transformers import DataCollatorForTokenClassification
from transformers import AutoModelForTokenClassification, TrainingArguments, Trainer
import os
import wandb as wandb
import torch

from sklearn.metrics import f1_score
from sklearn.metrics import accuracy_score
from sklearn.metrics import recall_score
from sklearn.metrics import precision_score

from statistics import mean 

# sequence length is 512. Some dialogs are getting truncated hence not using
#tokenizer_name = 'distilbert-base-uncased'
#model_name = 'distilbert-base-uncased'

# sequence length is 4096
tokenizer_name = 'google/bigbird-roberta-base'
model_name = 'google/bigbird-roberta-base'

os.environ['CUDA_LAUNCH_BLOCKING'] = '1'
os.environ['WANDB_PROJECT']='Capstone_Halucination'
seqeval = evaluate.load("seqeval")
metric = evaluate.load("accuracy")

COMPUTE_SCORE_METHOD = 0 # Seqeval
#COMPUTE_SCORE_METHOD = 1 # sklearn
#COMPUTE_SCORE_METHOD = 2 # fairseq

SEP1_TOKEN = "<SEP1>"
SEP2_TOKEN = "<SEP2>"
EOS_TOKEN = "<EOS>"

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
        
    return label_list, id2label, label2id

'''
    Does tokenizer encoding and label alignment due to sub-word tokenization
    refer: https://huggingface.co/docs/transformers/tasks/token_classification
    
    Note:
        source is array of tokens
        punctuations are not removed but are kept as tokens and labels (added space before and after punctuation in source text )
'''
def tokenize_and_align_labels(examples):
    tokenized_inputs = tokenizer(examples["source"], truncation=True, is_split_into_words=True)

    labels = []
    for i, label in enumerate(examples[f"tags"]):
        
        
        word_ids = tokenized_inputs.word_ids(batch_index=i)  # Map tokens to their respective word.
        previous_word_idx = None
        label_ids = []
        
        for word_idx in word_ids:  # Set the special tokens to -100.
            if word_idx is None:
                label_ids.append(-100)
            elif word_idx != previous_word_idx:  # Only label the first token of a given word.
                label_ids.append(label[word_idx])
            else:
                label_ids.append(-100)
            previous_word_idx = word_idx
        labels.append(label_ids)

    tokenized_inputs["labels"] = labels
    return tokenized_inputs

'''
    converts to IOB slot tag format... only B
'''
def convert_to_iob(d):
    for i in range(len(d)):
        for j in range(len(d[i])):
            if d[i][j] != 'O':
                d[i][j] = 'B-' + d[i][j]
    
    return d


'''
    compute metrics using seqeval.
    refer: https://huggingface.co/docs/transformers/tasks/token_classification
    ignores O label metric
'''
def compute_metrics_seqeval(predictions, labels):
    true_predictions = [
        [label_list[p] for (p, l) in zip(prediction, label) if l != -100]
        for prediction, label in zip(predictions, labels)
    ]
    true_labels = [
        [label_list[l] for (p, l) in zip(prediction, label) if l != -100]
        for prediction, label in zip(predictions, labels)
    ]
    
    # for seqeval prediction are expected in IOB format. So convert to IOB format
    true_labels_iob = convert_to_iob(true_labels)
    true_predictions_iob = convert_to_iob(true_predictions)
    
    
    results = seqeval.compute(predictions=true_predictions_iob, references=true_labels_iob)
    return {
        "precision": results["overall_precision"],
        "recall": results["overall_recall"],
        "f1": results["overall_f1"],
        "accuracy": results["overall_accuracy"],
    }


'''
    compute metrics using sklearn
    includes O label metric
'''
def compute_metrics_sklearn(predictions, labels):
    true_predictions = [
        [p for (p, l) in zip(prediction, label) if l != -100]
        for prediction, label in zip(predictions, labels)
    ]
    true_labels = [
        [l for (p, l) in zip(prediction, label) if l != -100]
        for prediction, label in zip(predictions, labels)
    ]
    
    f1= []
    acc=[]
    prec=[]
    recall= []
    for i in range(len(true_predictions)):
        pred_row = true_predictions[i]
        gold_row = true_labels[i]

        f1.append(f1_score(gold_row, pred_row, average='macro'))    
        acc.append(accuracy_score(gold_row, pred_row))    
        recall.append(recall_score(gold_row, pred_row, average='macro'))    
        prec.append(precision_score(gold_row, pred_row, average='macro'))  
        
    return {
        "precision": mean(prec) ,
        "recall": mean(recall),
        "f1": mean(f1),
        "accuracy": mean(acc),
    }

'''
    compute metrics using fairseq_hal style
    considers only hallucinated labels metrics
'''    
def compute_metrics_fairseq_hal(predictions, labels):
    true_predictions = [
        [label_list[p] for (p, l) in zip(prediction, label) if l != -100]
        for prediction, label in zip(predictions, labels)
    ]
    true_labels = [
        [label_list[l] for (p, l) in zip(prediction, label) if l != -100]
        for prediction, label in zip(predictions, labels)
    ]
    
    gold_correct = 0
    nh_correct = 0
    recall_total = 0
    precision_total = 0
    tot_tokens = 0
    ncorrect, nsamples = 0, 0
            
    for i in range(len(true_predictions)):
        pred_row = true_predictions[i]
        gold_row = true_labels[i]
        nh_correct += sum([1 for p, t in zip(pred_row, gold_row) if p == t and t != 'O' ])
        recall_total += sum([1 for label in gold_row if label != 'O'])
        precision_total += sum([1 for label in pred_row if label != 'O'])
        tot_tokens += len(pred_row)
        ncorrect += sum(np.array(pred_row) == np.array(gold_row))
        nsamples += len(gold_row)
        
    scores = {
        "precision": float(nh_correct)/float(precision_total) if precision_total > 0 else 0,
        "recall": float(nh_correct)/float(recall_total) if recall_total > 0 else 0,
        "accuracy": float(ncorrect)/float(nsamples) if nsamples > 0 else 9,
    }
    
    p_r = (scores['precision'] + scores['recall'])
    scores['f1'] = 2 * scores['precision'] * scores['recall'] / p_r if p_r > 0 else 0;
    return scores
     
'''
    Callback function from trainer to compute metrics
    depending on configured flag will compute metrics using seqeval, sklearn or fairseq_hal
'''
def compute_metrics(p):
    predictions, labels = p
    predictions = np.argmax(predictions, axis=2)

    score = {"precision":0, "recall":0, "f1":0, "accuracy":0}
    if COMPUTE_SCORE_METHOD == 0:
        score = compute_metrics_seqeval(predictions, labels)
    elif COMPUTE_SCORE_METHOD == 1:
        score = compute_metrics_sklearn(predictions, labels)
    else:
        score = compute_metrics_fairseq_hal(predictions, labels)
    
    return score
        
        
# load dataset
ds = load_dataset("Deojoandco/capstone_hal_with_gold")
label_list, id2label, label2id = get_label_dicts(ds)    # get id2label and label2id dictionary

# load tokenizer
tokenizer = AutoTokenizer.from_pretrained(tokenizer_name, add_prefix_space=True)
print(f'Tokenizer model_max_length: {tokenizer.model_max_length}')

# add our special tokens <SEP1>, <SEP2> and <EOS> to tokenizer
num_tokens_added = tokenizer.add_special_tokens({'sep_token': SEP1_TOKEN, 'sep_token': SEP2_TOKEN, 'eos_token': EOS_TOKEN})
print(f'Added extra special tokens: {num_tokens_added}')

#create data collator for batching
data_collator = DataCollatorForTokenClassification(tokenizer=tokenizer)

# load model
model = AutoModelForTokenClassification.from_pretrained(
    model_name, num_labels=len(label_list), id2label=id2label, label2id=label2id
)
model.resize_token_embeddings(len(tokenizer))   # adjust emb_dim of model as we added 2 extra tokens to tokenizer

# tokenize dataset and align labels after sub-word tokenization
tokenized_ds = ds.map(tokenize_and_align_labels, batched=True)
#print(tokenized_ds['test'][0])
#print('source len', len(ds['test'][0]['source']))
#print('tokenized len', len(tokenized_ds['test'][0]['input_ids']))


training_args = TrainingArguments(
    use_cpu = False,
    do_train=True,
    do_eval=True,
    do_predict=True,
    output_dir="capstone_hal_with_gold",
    learning_rate=2e-5,
    per_device_train_batch_size=1,
    per_device_eval_batch_size=1,
    num_train_epochs=10,
    weight_decay=0.01,
    evaluation_strategy="epoch",
    save_strategy="epoch",
    load_best_model_at_end=True,
    push_to_hub=True,
    report_to=["wandb"],
    logging_steps=10,
    metric_for_best_model="f1",
)

wandb.init()

trainer = Trainer(
    model=model,
    args=training_args,
    train_dataset=tokenized_ds["train"],
    eval_dataset=tokenized_ds["validation"],
    tokenizer=tokenizer,
    data_collator=data_collator,
    compute_metrics=compute_metrics,
)

trainer.train()

# run a final evaluation on the test set
results = trainer.evaluate(metric_key_prefix="test", eval_dataset=tokenized_ds['test'])

