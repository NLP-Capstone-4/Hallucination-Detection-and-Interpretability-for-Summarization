import pandas as pd
import re

data1 = """Summary- "Jacob forgot to listen to the song Harry sent 3 days ago; promises to do it later."
        
        Tags- "O O O O O O O O O O O O O O O"
        
        Explanation - The dialogue is about Harry asking Jacob if he had listened to a song that he sent 3 days ago, to which Jacob replied he had completely forgotten about it. Jacob promises to listen to it later. All the tokens in the summary are accurate and thus they are tagged as Not Hallucinated (O). There's no circumstance, object, or uncommon error, neither there's any wrong reference or information missing, hence all the tags are O."""

data2 = "O O O O O O O O O O O O O O O M Explanation - In this dialogue, Harry asks Jacob if he has listened to the song that he sent him 3 days ago. Jacob realizes that he forgot to listen to it and apologizes. Harry expresses his curiosity to know Jacob's opinion on the song. Jacob informs Harry that he is currently busy but will let him know later. So according to the summary, \"Jacob forgot to listen to the song Harry sent him 3 days ago. Harry will talk to Jacob later tonight\" is correct. However, the summary is missing the information that Harry is curious about Jacob's opinion on the song. Thus, \"curious what you'll think about it\" is missing from the summary and should be tagged as Missing Information (M) at the end. All other tokens are correct and not hallucinated."

def extract_summary_tags(data):
    dialogues = data.split("\n\n")
    extracted_data = []
    summary_pattern = r"Summary- (.*?);"
    tags_pattern = r"Tags- (.*?)\n"

    summary_match = re.search(summary_pattern, data)
    tags_match = re.search(tags_pattern, data)

    summary = summary_match.group(1) if summary_match else None
    tags = tags_match.group(1) if tags_match else None

    if summary and tags:
            extracted_data.append([summary, tags])

    return extracted_data

df1 = pd.DataFrame(extract_summary_tags(data1), columns=['summary', 'tags'])
print(df1)

def extract_tags(data):
  tokens = data.split()
  explanation_index = tokens.index("Explanation")
  tags = " ".join(tokens[:explanation_index])
  return tags

output = extract_tags(data2)
df2 = pd.DataFrame({"tags": [output]})
print(df2)


