#!/bin/bash
# 传入的变量，默认值为Meta-Llama-3.1-8B-Instruct  
set -x
export CUDA_VISIBLE_DEVICES=0

model_name=${1:-Meta-Llama-3.1-8B-Instruct}

save_dir="/mnt/lingjiejiang/textual_aesthetics/logs/mmlu_m1/eval_results_1/"
global_record_file="/mnt/lingjiejiang/textual_aesthetics/logs/mmlu_m1/eval_results_1/eval_record_collection.csv"
model="/mnt/lingjiejiang/textual_aesthetics/model_checkpoint/sft_merge_checkpoints/$model_name"
selected_subjects="all"
gpu_util=0.8

# cd ../../

python evaluate_from_local.py \
                 --selected_subjects $selected_subjects \
                 --save_dir $save_dir \
                 --model $model \
                 --global_record_file $global_record_file \
                 --gpu_util $gpu_util
