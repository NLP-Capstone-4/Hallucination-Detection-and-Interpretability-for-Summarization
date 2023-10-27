train_without_gold.py/train_with_gold.py will use the huggingface dataset prepared by prepare_withgold_dataset.py/prepare_withgold_dataset.py and finetune [google/bigbird-roberta-base]([https://huggingface.co/distilbert-base-uncased](https://huggingface.co/google/bigbird-roberta-base)) 

# Dependencies
  1. Install huggingface transformers, evaluate, seqeval and wandb (pip install transformers evaluate seqeval wandb)
  2. 'Deojoandco/capstone_hal' huggingface dataset created using 'prepare_hg_dataset.py'
  3. [Deojoandco/capstone_hal_without_gold](https://huggingface.co/datasets/Deojoandco/capstone_hal_without_gold) huggingface dataset created using 'prepare_withgold_dataset.py'
  4. [Deojoandco/capstone_hal_with_gold](https://huggingface.co/datasets/Deojoandco/capstone_hal_with_gold) huggingface dataset created using 'prepare_withgold_dataset.py'

# Loading the data
  1. load  dataset from huggingface
  2. Incorporate the two special tokens, <SEP> and <EOS>, utilized in the 'prepare_hg_dataset.py', into the 'distilbert-base-uncased' tokenizer. Afterward, adapt the embedding layer dimension of the model according to the length of the tokenizer.
  3. We'll get the dataset ready for training by utilizing the Tokenizer to create 'input_ids,' 'attention_mask,' and 'labels.' During this process, the tokenizer will incorporate certain special tokens, namely [CLS] and [SEP], and perform subword tokenization.
  4. This will create mismatch between the input and the labels. We’ll need to realign the tokens and labels by:
      * Mapping all tokens to their corresponding word with the word_ids method.
      * Assigning the label -100 to the special tokens [CLS] and [SEP] so they’re ignored by the PyTorch loss function
      * Only labeling the first token of a given word. Assign -100 to other subtokens from the same word.
     The 'tokenize_and_align_labels' function realigns the tokens and labels as described above

# Execution
Execute train_without_gold.py/train_with_gold.py just like any python script (python fine_tune.py).
It will evaluate on test split after training.

