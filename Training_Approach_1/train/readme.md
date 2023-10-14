'Fine_tune.py' will use the huggingface dataset prepared by 'prepare_hg_dataset.py' and finetune [distilbert-base-uncased](https://huggingface.co/distilbert-base-uncased) 

# Dependencies
  1. Install huggingface transformers, evaluate and seqeval (pip install transformers evaluate seqeval)
  2. 'Deojoandco/capstone_hal' huggingface dataset created using 'prepare_hg_dataset.py'

# Loading the data
  1. load 'Deojoandco/capstone_hal' dataset from huggingface
  2. Incorporate the two special tokens, <SEP> and <EOS>, utilized in the 'prepare_hg_dataset.py', into the 'distilbert-base-uncased' tokenizer. Afterward, adapt the embedding layer dimension of the model according to the length of the tokenizer.
  3. We'll get the dataset ready for training by utilizing the Tokenizer to create 'input_ids,' 'attention_mask,' and 'labels.' During this process, the tokenizer will incorporate certain special tokens, namely [CLS] and [SEP], and perform subword tokenization.
