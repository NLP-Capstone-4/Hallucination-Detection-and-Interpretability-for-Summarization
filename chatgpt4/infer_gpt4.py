import requests
import logging
import pandas as pd
import os
import openai
import json

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
    df = pd.read_csv(os.path.join(root_filepath, 'data', 'sample_annotated_capstone_data.csv')) 

    # Apply the custom function to each row along axis 1 (row-wise)
    df['gpt_4_generated'] = df.apply(query_gpt4, axis=1, args=(logger,))
    df.to_csv(os.path.join(root_filepath, 'data', 'gpt_4_summaries.csv'), index=False)

main()
