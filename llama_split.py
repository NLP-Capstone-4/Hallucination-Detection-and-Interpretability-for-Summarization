
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
from peft import LoraConfig
from trl import SFTTrainer
import math
import sys
import time
from pathlib import Path
from typing import Any, Optional

import lightning as L
import numpy as np
import torch
from lightning.pytorch.callbacks import ModelCheckpoint
from lightning.pytorch.loggers import CSVLogger
from lightning.pytorch.strategies import FSDPStrategy
from torch.utils.data import DataLoader, IterableDataset
wd = Path(__file__).parent.parent.resolve()
sys.path.append(str(wd))

from lit_gpt import Config
from lit_gpt.model import GPT, Block
# from lit_gpt.speed_monitor import SpeedMonitorCallback
from lit_gpt.utils import chunked_cross_entropy, get_default_supported_precision



model_name = "Llama-2-7b-hf"
# name = "lit-openwebtext"
# out_dir = Path("out") / name
# data_dir = Path("/data/aniket/openwebtext/") / name
save_interval = 1000
eval_interval = 1000
eval_iters = 100
log_interval = 1


#Hyperparameter
learning_rate = 6e-4
batch_size = 125
micro_batch_size = 1
gradient_accumulation_steps = batch_size // micro_batch_size
assert gradient_accumulation_steps > 0
max_iters = 600000  # num_epochs * (epoch_size // micro_batch_size) // devices
weight_decay = 1e-1
beta1 = 0.9
beta2 = 0.95
decay_lr = True
warmup_iters = 2000
lr_decay_iters = max_iters
min_lr = 6e-5

hparams = {
    k: v
    for k, v in locals().items()
    if isinstance(v, (int, float, str)) and not k.startswith("_")
}

dataset = load_dataset("csv", data_files="/home/bgarg/sample_annotated_capstone_data.csv")

val_dataloader = DataLoader(val_data, batch_size=micro_batch_size, num_workers=2)
train_dataloader = DataLoader(
        train_data, batch_size=micro_batch_size, num_workers=2
    )


devices = 4

class LightningGPTModule(L.LightningModule):
    def __init__(self, config: Config) -> None:
        super().__init__()
        self.config = config
        self.module: Optional[torch.nn.Module] = None
    def configure_model(self) -> None:
        self.module = GPT(self.config)
        self.module.apply(self.module._init_weights)
    def configure_optimizers(self) -> torch.optim.Optimizer:
        return torch.optim.AdamW(
            self.module.parameters(),
            lr=learning_rate,
            weight_decay=weight_decay,
            betas=(beta1, beta2),
            foreach=False,
        )
    def on_train_batch_start(self, batch: Any, batch_idx: int) -> None:
        if not decay_lr:
            return
        # determine and set the learning rate for this iteration
        lr = get_lr(self.trainer.fit_loop.total_batch_idx)
        for optimizer in self.trainer.strategy.optimizers:
            for param_group in optimizer.param_groups:
                param_group["lr"] = lr
    def training_step(self, batch: Any, batch_idx: int) -> torch.Tensor:
        input_ids, targets = batch
        logits = self.module(input_ids)
        loss = chunked_cross_entropy(logits, targets, chunk_size=0)
        self.log("train_loss", loss, on_step=True, on_epoch=False, prog_bar=True)
        return loss
    def validation_step(self, batch: Any, batch_idx: int) -> None:
        input_ids, targets = batch
        logits = self.module(input_ids)
        loss = chunked_cross_entropy(logits, targets, chunk_size=0)
        self.log("val_loss", loss, on_step=False, on_epoch=True, prog_bar=True)


strategy = FSDPStrategy(
        auto_wrap_policy={Block},
        activation_checkpointing_policy={Block},
        # the argument is not available in the Trainer strategy, but it's the default anyways
        # state_dict_type="full",
        limit_all_gathers=True,
        cpu_offload=False,
    )

trainer = L.Trainer(
        devices=devices,
        strategy=strategy,
        precision="bf16-true",
        max_steps=max_iters,
        max_epochs=1,
        limit_val_batches=eval_iters,
        accumulate_grad_batches=gradient_accumulation_steps,
        log_every_n_steps=log_interval,
        val_check_interval=eval_interval,
    )

trainer.fit(model, train_dataloader, val_dataloader, ckpt_path="last")