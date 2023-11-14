# from rouge import Rouge
# import pandas as pd


# def get_rouge(rouge, candidate_text, reference_text):
#     scores = rouge.get_scores(candidate_text, reference_text)['rouge-l']
#     # Extract specific ROUGE scores
#     rouge_1_recall = scores[0]['rouge-1']['r']
#     rouge_1_precision = scores[0]['rouge-1']['p']
#     rouge_1_f1 = scores[0]['rouge-1']['f']

#     rouge_2_recall = scores[0]['rouge-2']['r']
#     rouge_2_precision = scores[0]['rouge-2']['p']
#     rouge_2_f1 = scores[0]['rouge-2']['f']

#     rouge_l_recall = scores[0]['rouge-l']['r']
#     rouge_l_precision = scores[0]['rouge-l']['p']
#     rouge_l_f1 = scores[0]['rouge-l']['f']

#     return (rouge_1_precision, rouge_1_recall, rouge_1_f1, rouge_2_precision, 
#         rouge_2_recall, rouge_2_f1, rouge_l_precision, rouge_l_recall, rouge_l_f1) 



# def main():
#     df = pd.read_csv("/home/bgarg/Hallucination-Detection-and-Interpretability-for-Summarization/data/gpt_4_summaries.csv")
#     df = df[['Reference Summary', 'gpt_4_generated_summaries']]
#     rouge = Rouge()
#     hyps, refs = map(list, zip(*[[d['hyp'], d['Reference Summary']] for index, d in df.iterrows()]))
#     candidate_text = df['gpt_4_generated_summaries'].tolist()
#     df['gpt_4_generated_summaries'] = df['gpt_4_generated_summaries'].apply(lambda x: [x])
#     reference_text = df['Reference Summary'].tolist()
#     a = get_rouge(rouge, candidate_text=candidate_text, reference_text=reference_text )
#     print(a)


# main()



# from evaluate import load
# import pandas as pd

# rouge = load('rouge')

# base_file = "/home/bgarg/Hallucination-Detection-and-Interpretability-for-Summarization/data/annotated_capstone_data.csv"
# prediction_file = "/home/bgarg/Hallucination-Detection-and-Interpretability-for-Summarization/data/one_shot_summ_tags.csv"

# base_df = pd.read_csv(base_file)
# prediction_df = pd.read_csv(prediction_file)

# print("base_df shape", base_df.shape)
# print("prediction_df shape", prediction_df.shape) 
# final_df = prediction_df.merge(base_df, on=["ID"], how= "left")
# print("final_df shape", final_df.shape) 
# final_df = final_df[["gpt_4_tags", "Annotations"]]
# final_df['gpt_4_tags'] = final_df['gpt_4_tags'].str.replace('"', '')

# for index,row in final_df.iterrows():
#     # print(type(row["gpt_4_tags"]),type(row["Annotations"]))
#     # print(row["gpt_4_tags"].split())
#     if len(row["gpt_4_tags"]) == len(row["Annotations"]):
#         print("1")



# final_df['gpt_4_generated_summaries'] = final_df['gpt_4_generated_summaries'].apply(lambda x: x.strip())
# final_df['Reference Summary'] = final_df['Reference Summary'].apply(lambda x: x.strip())

# candidate_text = final_df['gpt_4_generated_summaries'].tolist()
# reference_text = final_df['Reference Summary'].tolist()
# results = rouge.compute(predictions=candidate_text, references=reference_text)
# print(results)

# tag evaluation


#evalaute for base models

from evaluate import load
import pandas as pd

rouge = load('rouge')

base_file = "/home/bgarg/Hallucination-Detection-and-Interpretability-for-Summarization/data/annotated_capstone_data.csv"


base_df = pd.read_csv(base_file)
base_df = base_df[['Reference Summary', 'Generated Summary','Model Name' ]]
all_models = base_df['Model Name'].unique().tolist()
mdf= pd.DataFrame({"metric":["rouge1",'rouge2','rougeL','rougeLsum']})
for single_model in all_models:
    print(single_model)
    model_df = base_df[base_df['Model Name']==single_model]
    candidate_text = model_df['Generated Summary'].tolist()
    reference_text = model_df['Reference Summary'].tolist()
    results = rouge.compute(predictions=candidate_text, references=reference_text)
    temp_result_df = pd.DataFrame(results.items())
    temp_result_df = temp_result_df.rename(columns={0: "metric", 1:single_model})
    mdf = temp_result_df.merge(mdf, on=['metric'])
    # print(temp_result_df)
    # print(results)

mdf.to_csv("base_models_rougue.csv", index = False)
# print("base_df shape", base_df.shape)
# print("prediction_df shape", prediction_df.shape) 
# final_df = prediction_df.merge(base_df, on=["ID"], how= "left")
# print("final_df shape", final_df.shape) 
# final_df = final_df[["gpt_4_tags", "Annotations"]]
# final_df['gpt_4_tags'] = final_df['gpt_4_tags'].str.replace('"', '')

# for index,row in final_df.iterrows():
#     # print(type(row["gpt_4_tags"]),type(row["Annotations"]))
#     # print(row["gpt_4_tags"].split())
#     if len(row["gpt_4_tags"]) == len(row["Annotations"]):
#         print("1")



# final_df['gpt_4_generated_summaries'] = final_df['gpt_4_generated_summaries'].apply(lambda x: x.strip())
# final_df['Reference Summary'] = final_df['Reference Summary'].apply(lambda x: x.strip())

# candidate_text = final_df['gpt_4_generated_summaries'].tolist()
# reference_text = final_df['Reference Summary'].tolist()
# results = rouge.compute(predictions=candidate_text, references=reference_text)
# print(results)

# tag evaluation


