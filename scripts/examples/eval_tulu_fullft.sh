#!/bin/bash  
  
# 打开调试模式  
set -x  
  
# 默认模型名称和超参数  
DEFAULT_MODEL_NAME="Meta-Llama-3.1-8B-Instruct"  
DEFAULT_HYPERPARAMETER="fullft_lr5e6_e3"  
DEFAULT_CHECKPOINT="checkpoint-8500"  
  
# 检查是否传入了参数，如果没有则使用默认值  
MODEL_NAME=${1:-$DEFAULT_MODEL_NAME}  
HYPERPARAMETER=${2:-$DEFAULT_HYPERPARAMETER}  
CHECKPOINT=${3:-$DEFAULT_CHECKPOINT}  
  
# 设定保存目录和全局记录文件  
save_dir="eval_results/"  
global_record_file="eval_results/eval_record_collection.csv"  
  
# 模型路径更新为新的格式  
model_path="/mnt/lingjiejiang/textual_aesthetics/exp/saves/$MODEL_NAME/$HYPERPARAMETER/sft/$CHECKPOINT"  
model=$MODEL_NAME

# 选择的主题和GPU利用率  
selected_subjects="all"  
gpu_util=0.8  
  
# 执行Python脚本  
python evaluate_from_local_fullft.py \
                 --selected_subjects $selected_subjects \
                 --save_dir $save_dir \
                 --model $model \
                 --model_path $model_path \
                 --global_record_file $global_record_file \
                 --gpu_util $gpu_util
 
