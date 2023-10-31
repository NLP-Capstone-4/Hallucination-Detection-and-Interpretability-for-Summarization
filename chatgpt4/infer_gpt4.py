import logging
import pandas as pd
import os
import openai
import time

def query_gpt4(row, logger):
    base_prompt_1 = """Generate a summary for the given set of dialogues by referring to the gold summary. The summary should be short, with length ranging between 10 to 15 words.
    Dialogue:
    """
    base_prompt_2 = """
    Gold Summary: 
    """
    base_prompt_3 = """
    Generated Summary:
    """
    response = openai.ChatCompletion.create(
        model="gpt-4",
        messages=[
            {
            "role": "user",
            "content": base_prompt_1 + str(row[1]) + base_prompt_2 + str(row[2]) + base_prompt_3
            }
        ],
        temperature=0.001,
        max_tokens=512,
        top_p=1,
        frequency_penalty=0,
        presence_penalty=0
        )
    #result = response.json()
    choices = response['choices']
    chat_reply = ""
    if len(choices) > 0:
        chat_reply = choices[0]['message']['content']
    else:
        logger.error("Error - Conversaition ID - " + str(row[0]) + response.status_code)
    return chat_reply

def generate_tags(row, logger):
    base_prompt_1 = """
    Given a set of dialogues and its summary, the task is to do token-level classification based on whether it is hallucinated or not. Use the following tag classes to label each token of the summary. 
    O = Not Hallucinated,
    W =  Wrong person reference,
    C = Circumstancial error,
    OB = Object error,
    N = uncommon errors like tense errors 
    M = Missing information
    The tag M should only be added at the end of the sequence incase the summary is missing any information and not as a tag specific to a word in the summary. 

    Dialogue- "Hannah: Hey, do you have Betty's number?
    Amanda: Lemme check
    Hannah: <file_gif>
    Amanda: Sorry, can't find it.
    Amanda: Ask Larry
    Amanda: He called her last time we were at the park together
    Hannah: I don't know him well
    Hannah: <file_gif>
    Amanda: Don't be shy, he's very nice
    Hannah: If you say so..
    Hannah: I'd rather you texted him
    Amanda: Just text him 馃檪
    Hannah: Urgh.. Alright
    Hannah: Bye
    Amanda: Bye bye"

    Summary- "Amanda can't find Betty's number. Larry called her last time they were at the park together. Amanda will text Larry."

    Tags- "O O O O O O O O O O O O O O O O O O W O O O O"

    Similarly, for the next dialogue and summary below, generate tags for the summary.

    Dialogue-
    """

    base_prompt_2 = """
    Summary- """

    base_prompt_3 = """
    Tags- """

    response = openai.ChatCompletion.create(
        model="gpt-4",
        messages=[
            {
            "role": "user",
            "content": base_prompt_1 + str(row[1]) + base_prompt_2 + str(row[18]) + base_prompt_3
            }
        ],
        temperature=0.001,
        max_tokens=256,
        top_p=1,
        frequency_penalty=0,
        presence_penalty=0
        )
    #result = response.json()
    choices = response['choices']
    chat_reply = ""
    if len(choices) > 0:
        chat_reply = choices[0]['message']['content']
    else:
        logger.error("Error - Conversaition ID - " + str(row[0]) + response.status_code)
    return chat_reply


def generated_sum_tags_together(row):
    dialogue, gold_summaries = row[1], row[2]
    result = []
    chain_1_prompt_1 = """
    Generate a summary for the given set of dialogues by referring to the gold summary. The summary should be short, with length ranging between 10 to 15 words.

    Dialogue:
    """
    chain_1_prompt_2 = """
    Gold Summary:
    """
    chain_1_prompt_3 = """
    Generated Summary:
    """
    chain_2_prompt_1 = """
    Further based on the given below information, perform token classification on the generated summary to tag whether the summary is hallucinated or not. Use the following tag classes to label each token of the summary. 
    O = Not Hallucinated,
    W =  Wrong person reference,
    C = Circumstancial error,
    OB = Object error,
    N = uncommon errors like tense errors 
    M = Missing information
    The tag M should only be added at the end of the sequence incase the summary is missing any information and not as a tag specific to a word in the summary. 

    Here's an example for the same set of dialogues:
    Generated Summary: "Amanda can't find Betty's number. Larry called her last time they were at the park together. Amanda will text Larry."
    Tags: "O O O O O O O O O O O O O O O O O O W O O O O"

    Similarly, generate the tags for the following set generated summaries.
    Generated Summary:
    """
    chain_2_prompt_2 = """
    Tags:
    """
    generated_summ = ""
    generated_tags = ""
    chain_of_thoughts = [["user", chain_1_prompt_1 + dialogue + chain_1_prompt_2 + gold_summaries], 
            ["user", ""]]
    chain_so_far = []
    for i in range(0, len(chain_of_thoughts)):
        chain_so_far.append({
            "role": chain_of_thoughts[i][0],
            "content": chain_of_thoughts[i][1]
        })
        response = openai.ChatCompletion.create(
        model="gpt-4",
        messages=chain_so_far,
        temperature=0.001,
        max_tokens=512,
        top_p=1,
        frequency_penalty=0,
        presence_penalty=0
        )
        choices = response['choices']
        if len(choices) > 0:
            if i == 0:
                generated_summ = choices[0]['message']['content']
                chain_of_thoughts[i+1][1] = chain_2_prompt_1 + generated_summ + chain_2_prompt_2
            elif i == 1:
                generated_tags = choices[0]['message']['content']
        chain_so_far.append({
            "role": "assistant",
            "content": generated_summ 
        })
    time.sleep(10)
    return (generated_summ, generated_tags)
        

def main():
    openai.api_key = "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"
    logger = logging.getLogger('my_logger')
    logger.setLevel(logging.DEBUG)
    file_handler = logging.FileHandler('log.txt')
    formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
    file_handler.setFormatter(formatter)
    logger.addHandler(file_handler)
    
    code_filepath = os.path.dirname(os.path.abspath(__file__))
    root_filepath = os.path.dirname(code_filepath)
    df = pd.read_csv(os.path.join(root_filepath, 'data', 'annotated_capstone_data.csv')) 

    df = df.sample(n=50)
    # Apply the custom function to each row along axis 1 (row-wise)
    #df['gpt_4_generated_summaries'] = df.apply(query_gpt4, axis=1, args=(logger,))
    #df['gpt_4_tags'] = df.apply(generate_tags, axis=1, args=(logger,))
    
    df[['gpt_4_generated_summaries', 'gpt_4_tags']] = df.apply(generated_sum_tags_together, axis=1).apply(pd.Series)
    df.to_csv(os.path.join(root_filepath, 'data', 'gpt_4_summaries.csv'), index=False)

main()
