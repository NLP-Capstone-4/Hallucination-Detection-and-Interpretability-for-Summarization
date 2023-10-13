prepare_hg_dataset.py script reads 'annotated_capstone_data.xlsx' and converts in to a huggingface dataset for training. It uses 'Dialog', 'Generated Summary' and 'Annotations' fields from the xlsx file

# Dependencies
   1. 'annotated_capstone_data.xlsx' should be in same folder of the script
   2. Number of 'Annotations' token count and 'Generated Summary' token count should be matching.
   3. Punctuation within the 'Generated Summary' is maintained when included in the 'Annotations' tagging. This is accomplished by adding spaces between the punctuation marks ('!',',','.','?',":",";") and then tokenizing based on the spaces.
   4. Huggingface datasets (pip install datasets)

# Algorithm

   1. Curate text (by removing new line characters, adding spaces between punctuation marks) for 'Dialog', 'Generated Summary' and 'Annotations' fields
   2. Generate the 'source' field by combining the 'Dialog' and 'Generated Summary' fields, using a unique separator token in between. The source format will follow this pattern: 'Dialog' <SEP> 'Generated Summary'.
   

