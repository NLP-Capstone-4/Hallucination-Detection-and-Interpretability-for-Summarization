from rouge import Rouge


def get_rouge(rouge, candidate_text, reference_text):
    scores = rouge.get_scores(candidate_text, reference_text)['rouge-l']
    # Extract specific ROUGE scores
    rouge_1_recall = scores[0]['rouge-1']['r']
    rouge_1_precision = scores[0]['rouge-1']['p']
    rouge_1_f1 = scores[0]['rouge-1']['f']

    rouge_2_recall = scores[0]['rouge-2']['r']
    rouge_2_precision = scores[0]['rouge-2']['p']
    rouge_2_f1 = scores[0]['rouge-2']['f']

    rouge_l_recall = scores[0]['rouge-l']['r']
    rouge_l_precision = scores[0]['rouge-l']['p']
    rouge_l_f1 = scores[0]['rouge-l']['f']

    return (rouge_1_precision, rouge_1_recall, rouge_1_f1, rouge_2_precision, 
        rouge_2_recall, rouge_2_f1, rouge_l_precision, rouge_l_recall, rouge_l_f1) 

def main():
    rouge = Rouge()


main()
