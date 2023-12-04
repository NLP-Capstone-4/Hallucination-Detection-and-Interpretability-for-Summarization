import os
import torch
from datasets import load_dataset
from transformers import (
    AutoModelForCausalLM,
    AutoTokenizer,
    BitsAndBytesConfig,
    TrainingArguments,
    pipeline,
    logging,
)
from peft import LoraConfig, PeftModel
from trl import SFTTrainer

base_model = "NousResearch/Llama-2-13b-chat-hf"
new_model = "llama-2-13b-chat-hallucination-samsum"

compute_dtype = getattr(torch, "float16")

quant_config = BitsAndBytesConfig(
    load_in_4bit=True,
    bnb_4bit_quant_type="nf4",
    bnb_4bit_compute_dtype=compute_dtype,
    bnb_4bit_use_double_quant=False,
)
tokenizer = AutoTokenizer.from_pretrained(base_model, trust_remote_code=True)

model = AutoModelForCausalLM.from_pretrained(
    base_model,
    quantization_config=quant_config,
    device_map={"": 0}
)


pipe = pipeline(task="text-generation", model=model, tokenizer=tokenizer, max_length=4096 )



prompt_template ="""
### Instruction:
Given a set of dialogues, the task is to generate a summary of 10-15 words by considering all the dialogues, and do token-level classification on the summary based on whether it is hallucinated or not. Use the following tag classes to label each token of the summary.
O = Not Hallucinated,
W =  Wrong person reference,
C = Circumstantial error,
OB = Object error,
N = uncommon errors like tense errors
M = Missing information
The tag M should only be added at the end of the sequence incase the summary is missing any information and not as a tag specific to a word in the summary.

### Input:
[INST]
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
[/INST]

###Response: 
Summary- "Amanda can't find Betty's number. Larry called her last time they were at the park together. Amanda will text Larry."

Tags- "O O O O O O O O O O O O O O O O O O W O O O O"

Explanation - Let's think step by step. The dialogue is about Hannah asking for Betty's number to Amanda, who couldn't find it and suggests to ask Larry for it since he had called her(Betty) the last time they were in the park together. Hannah doesn't know him(Larry) well and is shy to text him, but Amanda asks her to do it anyway.  So according to the summary, "Amanda will text Larry" is incorrect. The way to correct this information is the token Amanda can be changed to Hannah. This is Wrong Reference (W) from the tokens described above. All other tokens are correct and are thus Not Hallucinated (O).

[INST]
Dialogue- "Harry: and? have you listened to it?
Jacob: listened to what?
Harry: to the song i sent you 3 days ago -.-
Jacob: oh shit, i completely forgot...
Harry: ofc again
Jacob: don't be like this :* i'll do that later tonight
Harry: heh, okay
Harry: i'm really curious what you'll think about it
Jacob: i'll let you know, a bit busy right now, speak to you later!
Harry: okay"
[/INST]

###Response: 
"""

input_sentence = prompt_template

result = pipe(input_sentence)
print(result[0]['generated_text'])