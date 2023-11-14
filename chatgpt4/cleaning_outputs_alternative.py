import pandas as pd
import re

data1 = """'Summary- "Emma is not hungry and doesn\'t want dinner. She assures Will she\'ll be home soon and will update him."\n\nTags- "O O O O O O O O O O O O O O O O O O O O"\n\nExplanation- The conversation is about Will asking Emma about dinner plans. Emma is not feeling well and assures Will that she doesn\'t need dinner and will be home soon. She also promises to update him once she\'s home. The summary accurately captures this, hence all tokens are Not Hallucinated (O).'"""
data2 = "O O O O O O O O O O O O O O O M Explanation - In this dialogue, Harry asks Jacob if he has listened to the song that he sent him 3 days ago. Jacob realizes that he forgot to listen to it and apologizes. Harry expresses his curiosity to know Jacob's opinion on the song. Jacob informs Harry that he is currently busy but will let him know later. So according to the summary, \"Jacob forgot to listen to the song Harry sent him 3 days ago. Harry will talk to Jacob later tonight\" is correct. However, the summary is missing the information that Harry is curious about Jacob's opinion on the song. Thus, \"curious what you'll think about it\" is missing from the summary and should be tagged as Missing Information (M) at the end. All other tokens are correct and not hallucinated."

def extract_summary_tags(data):

    summary_pattern = re.compile(r'Summary- "(.*?)"', re.DOTALL)
    tags_pattern = re.compile(r'Tags- "(.*?)"', re.DOTALL)
    explanation_pattern = re.compile(r'Explanation- (.*)', re.DOTALL)

    # Extract information using regex
    summary_match = summary_pattern.search(data)
    tags_match = tags_pattern.search(data)
    explanation_match = explanation_pattern.search(data)

    # Create a dictionary with extracted information
    data_dict = {
        'Summary': summary_match.group(1).strip() if summary_match else None,
        'Tags': tags_match.group(1).strip() if tags_match else None,
        'Explanation': explanation_match.group(1).strip() if explanation_match else None
    }

    df = pd.DataFrame([data_dict])


    return df

df1 = extract_summary_tags(data1)
print(df1)

def extract_tags(data):
  tokens = data.split()
  explanation_index = tokens.index("Explanation")
  tags = " ".join(tokens[:explanation_index])
  return tags

output = extract_tags(data2)
df2 = pd.DataFrame({"tags": [output]})
print(df2)


