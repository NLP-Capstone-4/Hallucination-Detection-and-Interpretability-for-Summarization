import pandas as pd


file_path = '/home/bgarg/custom_new/Hallucination-Detection-and-Interpretability-for-Summarization/data/annotated_capstone_data.csv' 
data = pd.read_csv(file_path)
data = data[['ID','Dialogue','Generated Summary', 'Annotations']]

data['Combined'] = "<START_C>" + data['Dialogue'] + "<END_C>  <START_S>" + data['Generated Summary'] + "<END_S>  <START_A>" + data['Annotations'] + "<END_A>"

data['Combined'] = """ """+data['Combined']+ """ """

train = data.iloc[:400,:]
val = data.iloc[400:500,:]
test = data.iloc[500:,:]

train.to_csv('/home/bgarg/custom_new/Hallucination-Detection-and-Interpretability-for-Summarization/data/train_llama_data.csv', index=False, encoding="utf8")
val.to_csv('/home/bgarg/custom_new/Hallucination-Detection-and-Interpretability-for-Summarization/data/val_llama_data.csv', index=False, encoding="utf8")
test.to_csv('/home/bgarg/custom_new/Hallucination-Detection-and-Interpretability-for-Summarization/data/test_llama_data.csv', index=False, encoding="utf8")

train.to_json('/home/bgarg/custom_new/Hallucination-Detection-and-Interpretability-for-Summarization/data/train_llama_data.json')
val.to_json('/home/bgarg/custom_new/Hallucination-Detection-and-Interpretability-for-Summarization/data/val_llama_data.json', orient="index")
test.to_json('/home/bgarg/custom_new/Hallucination-Detection-and-Interpretability-for-Summarization/data/test_llama_data.json', orient="index")