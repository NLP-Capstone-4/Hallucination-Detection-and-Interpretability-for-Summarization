eval_without_gold.py/eval_with_gold.py will use the huggingface dataset and trained huggingface models prepared by code from data_prep and train folders.

# Dependencies
  1. Install huggingface transformers, evaluate (pip install transformers evaluate)
  2. [Deojoandco/capstone_hal_without_gold](https://huggingface.co/datasets/Deojoandco/capstone_hal_without_gold) huggingface dataset created using 'prepare_withgold_dataset.py'
  3. [Deojoandco/capstone_hal_with_gold](https://huggingface.co/datasets/Deojoandco/capstone_hal_with_gold) huggingface dataset created using 'prepare_withgold_dataset.py'
  4. [Deojoandco/capstone_hal_without_gold](https://huggingface.co/Deojoandco/capstone_hal_without_gold) huggingface models created by train_without_gold.py
  5. [Deojoandco/capstone_hal_with_gold](https://huggingface.co/Deojoandco/capstone_hal_with_gold) huggingface models created by train_with_gold.py

# Execution
Execute eval_without_gold.py/eval_with_gold.py just like any python code file.

# Output
Please refer output folder for prediction output files

