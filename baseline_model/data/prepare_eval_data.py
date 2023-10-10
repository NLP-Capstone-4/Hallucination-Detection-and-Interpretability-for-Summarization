import pandas as pd

def remove_newlines(text):
    return " ".join(text.split('\n'))

def curate_label(row):
    annotation_tokens = []
    if type(row['Annotations']) == str:
        annotation_tokens = remove_newlines(row['Annotations']).split()
    
    curated_label_tokens = []
    for annotation_token in annotation_tokens:
        if annotation_token == 'O':
            curated_label_tokens.append("0")
        else:
            curated_label_tokens.append("1")
    
    if len(curated_label_tokens) > 0:
        curated_label_tokens = curated_label_tokens[0:len(curated_label_tokens)-1]    
    return ' '.join(curated_label_tokens)

def write_file(filename, file_data):
    with open(filename, 'w') as fp:
        for item in file_data:
            # write each item on a new line
            fp.write("%s\n" % item)

df = pd.read_excel('annotated_capstone_data.xlsx')

# remove \n before writing to file

sources = df['Dialogue'].apply(remove_newlines).tolist()
write_file('file.source', sources)

refs = df['Reference Summary'].apply(remove_newlines).tolist()
write_file('file.ref', refs)

targets = df['Generated Summary'].apply(remove_newlines).tolist()
write_file('file.target', targets)

labels = df.apply(curate_label, axis=1).tolist()
write_file('file.label', labels)


    