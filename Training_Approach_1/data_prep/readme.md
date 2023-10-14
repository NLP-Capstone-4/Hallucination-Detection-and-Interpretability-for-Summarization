prepare_hg_dataset.py script reads 'annotated_capstone_data.xlsx' and converts in to a huggingface dataset for training. It uses 'Dialog', 'Generated Summary' and 'Annotations' fields from the xlsx file

# Dependencies
   1. 'annotated_capstone_data.xlsx' should be in same folder of the script
   2. Number of 'Annotations' token count and 'Generated Summary' token count should be matching.
   3. Punctuation within the 'Generated Summary' is maintained when included in the 'Annotations' tagging. This is accomplished by adding spaces between the punctuation marks ('!',',','.','?',":",";") and then tokenizing based on the spaces.
   4. Huggingface datasets (pip install datasets)

# Algorithm

   1. Curate text (by removing new line characters, adding spaces between punctuation marks) for 'Dialog', 'Generated Summary' and 'Annotations' fields
   2. Generate the 'source' field by combining the 'Dialog' and 'Generated Summary' fields, using a unique separator token in between. The source format will follow this pattern: 'Dialog' <SEP> 'Generated Summary'.
   3. Generate tags (gold labels) for the source by adding 'O' in front of the existing 'Annotations' for 'Dialog' tokens and the special separator token <SEP>. It's important to observe that the final token in our 'Annotations' (O or M) will correspond to the special ending token <EOS>.
   4. Create distinctive feature names (unique labels) based on the gold labels (tags) and subsequently perform one-hot encoding on the tags using the corresponding feature name index.
   5. Tokenize 'source' and 'tags'
   6. Upload dataset on huggingface (Deojoandco/capstone_hal)[https://huggingface.co/datasets/Deojoandco/capstone_hal]
   

