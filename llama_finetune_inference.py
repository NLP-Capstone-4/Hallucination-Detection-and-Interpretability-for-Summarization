
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


base_model = "NousResearch/Llama-2-70b-chat-hf"
new_model = "llama-2-70b-chat-hallucination-samsum"



train_dataset = load_dataset("csv", data_files="/home/bgarg/custom_new/Hallucination-Detection-and-Interpretability-for-Summarization/annotated_capstone_data_train.csv")
val_dataset = load_dataset("csv", data_files="/home/bgarg/custom_new/Hallucination-Detection-and-Interpretability-for-Summarization/annotated_capstone_data_val.csv")


train_dataset['train']



compute_dtype = getattr(torch, "float16")

quant_config = BitsAndBytesConfig(
    load_in_4bit=True,
    bnb_4bit_quant_type="nf4",
    bnb_4bit_compute_dtype=compute_dtype,
    bnb_4bit_use_double_quant=False,
)


model = AutoModelForCausalLM.from_pretrained(
    base_model,
    quantization_config=quant_config,
    device_map={"": 0}
)
model.config.use_cache = False
model.config.pretraining_tp = 1


special_tokens = ["<START_C>", "<END_C>", "<START_S>", "<END_S>", "<START_A>", "<END_A>" ]
tokenizer = AutoTokenizer.from_pretrained(base_model, trust_remote_code=True)
tokenizer.pad_token = tokenizer.eos_token
tokenizer.padding_side = "right"
tokenizer.is_split_into_words=True
tokenizer.add_tokens(special_tokens, special_tokens=True)


peft_params = LoraConfig(
    lora_alpha=16,
    lora_dropout=0.1,
    r=64,
    bias="none",
    task_type="CAUSAL_LM",
)


# training_params = TrainingArguments(
#     output_dir="./results",
#     num_train_epochs=5,
#     per_device_train_batch_size=4,
#     gradient_accumulation_steps=1,
#     gradient_checkpointing=True,
#     optim="paged_adamw_32bit",
#     save_steps=0,
#     logging_steps=1,
#     learning_rate=1e-4,
#     weight_decay=0.001,
#     fp16=False,
#     bf16=False,
#     max_grad_norm=0.3,
#     warmup_ratio=0.03,
#     group_by_length=True,
#     lr_scheduler_type="cosine",
# )


# val_dataset['train'][0]


# trainer = SFTTrainer(
#     model=model,
#     train_dataset=train_dataset['train'],
#     peft_config=peft_params,
#     dataset_text_field='Dialogue',
#     max_seq_length=None,
#     tokenizer=tokenizer,
#     args=training_params,
#     packing=False,
#     eval_dataset = val_dataset['train'],
# )



# trainer.train()


# trainer.model.save_pretrained(new_model)
# trainer.tokenizer.save_pretrained(new_model)


fn_model = PeftModel.from_pretrained(model, '/home/bgarg/llama-2-70b-chat-hallucination-samsum')
# fn_model = fn_model.merge_and_unload()
pipe = pipeline(task="text-generation", model=fn_model, tokenizer=tokenizer, max_length=4096)


prompt_template = """### Instruction:
Generate a informative summary for the following conversation. the length should be 15-20 words.
### Input:
Judy: Why am I always attracted to jerks??
Janice: It didnéˆ¥æª› work out with Andrew?
Judy: He just wanted to fuck me
Judy: When he got what he wanted he stopped calling and texting.
Janice: And Bruce? Heéˆ¥æªš not a jerk.
Judy: Heéˆ¥æªš sweet. Maybe too sweet for meéˆ¥ï¿½
Judy: Heéˆ¥æªš a lovely and caring guy but I donéˆ¥æª› feel the butterflieséˆ¥ï¿½ 

### Response:

Summary-

"""

input_sentence = prompt_template

result = pipe(input_sentence)
print(result[0]['generated_text'])


# logging.set_verbosity(logging.CRITICAL)

# prompt = '''
# Given a set of dialogues, the task is to generate a summary of 10-15 words by considering all the dialogues, and do token-level classification on the summary based on whether it is hallucinated or not. Use the following tag classes to label each token of the summary.
# O = Not Hallucinated,
# W =  Wrong person reference,
# C = Circumstantial error,
# OB = Object error,
# N = uncommon errors like tense errors
# M = Missing information
# The tag M should only be added at the end of the sequence incase the summary is missing any information and not as a tag specific to a word in the summary.

# Dialogue- "Hannah: Hey, do you have Betty's number?
# Amanda: Lemme check
# Hannah: <file_gif>
# Amanda: Sorry, can't find it.
# Amanda: Ask Larry
# Amanda: He called her last time we were at the park together
# Hannah: I don't know him well
# Hannah: <file_gif>
# Amanda: Don't be shy, he's very nice
# Hannah: If you say so..
# Hannah: I'd rather you texted him
# Amanda: Just text him 馃檪
# Hannah: Urgh.. Alright
# Hannah: Bye
# Amanda: Bye bye"

# Summary- "Amanda can't find Betty's number. Larry called her last time they were at the park together. Amanda will text Larry."

# Tags- "O O O O O O O O O O O O O O O O O O W O O O O"

# Explanation - Let's think step by step. The dialogue is about Hannah asking for Betty's number to Amanda, who couldn't find it and suggests to ask Larry for it since he had called her(Betty) the last time they were in the park together. Hannah doesn't know him(Larry) well and is shy to text him, but Amanda asks her to do it anyway.  So according to the summary, "Amanda will text Larry" is incorrect. The way to correct this information is the token Amanda can be changed to Hannah. This is Wrong Reference (W) from the tokens described above. All other tokens are correct and are thus Not Hallucinated (O).

# Similarly, for the next dialogue, generate summary of all the dialogues and tags for the summary. Think step by step to explain it.

# Dialogue- "Harry: and? have you listened to it?
# Jacob: listened to what?
# Harry: to the song i sent you 3 days ago -.-
# Jacob: oh shit, i completely forgot...
# Harry: ofc again
# Jacob: don't be like this :* i'll do that later tonight
# Harry: heh, okay
# Harry: i'm really curious what you'll think about it
# Jacob: i'll let you know, a bit busy right now, speak to you later!
# Harry: okay"

# Summary-
# Tags-
# Explanation-
# '''

# pipe = pipeline(task="text-generation", model=model, tokenizer=tokenizer)
# result = pipe(f"<s>[INST] {prompt} [/INST]")
# print(result[0]['generated_text'])





# from tensorboard import notebook
# log_dir = "results/runs"
# notebook.start("--logdir {} --port 4000".format(log_dir))


# !kill 4371





