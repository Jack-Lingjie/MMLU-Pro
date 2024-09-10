#!/bin/bash  
set -x
conda activate eval
# 模型名称列表  
# models=(
#     "tulu_lora_sft_base_template_8b" 
#     "tulu_v2_8b_base_template_dpo" 
#     "tulu_v2_8b_bsz64_default_template_dpo" 
#     "tulu_lora_sft_default_template_8b" 
#     "Meta-Llama-3.1-8B-Instruct")  
models=(
    "ta_v2_rejected_noneed_length_tuluv2_dpo_2048_default_template_bsz1_acc8_v2"
    "ta_v2_rejected_noneed_tuluv2_dpo_2048_default_template_bsz1_acc8_v2"
    "ta_v2_chosen_tuluv2_dpo_2048_default_template_bsz1_acc8_v2"
    "ta_v2_chosen_tuluv2_dpo_2048_default_template_bsz1_acc8_v5"
    "ta_v2_rejected_tuluv2_dpo_2048_default_template_bsz1_acc8_v5"
    "ta_rejected_tuluv2_dpo_2048_default_template_bsz1_acc8_v4" 
    "ta_v2_rejected_tuluv2_dpo_2048_default_template_bsz1_acc8" 
    "ta_v2_rejected_tuluv2_dpo_2048_default_template_bsz1_acc8_v2"
    "ta_v2_rejected_tuluv2_dpo_2048_default_template_bsz1_acc8_v3"
    "ta_v2_rejected_tuluv2_dpo_2048_default_template_bsz1_acc8_v4"
    # "uf_llama3.1_instruct_dpo_2048_job"
    # "ta_chosen_tuluv2_merge_dpo_2048_default_template"
    # "glan_v2_8b_2048_default_template_9490"
    # "glanchat_v2_8b_2048_default_template_fullft_lr5e6_e3"
    # "ta_rejected_llama3.1_instruct_2048_default_template_v2"
    # "ta_rejected_tuluv2_dpo_2048_default_template_bsz1_acc8"
    # "ta_rejected_tuluv2_dpo_2048_default_template_bsz1_acc8_v2"
    # "ta_rejected_tuluv2_dpo_2048_default_template_bsz1_acc8_v3"
    # "ta_chosen_tuluv2_dpo_2048_default_template"
    # "ta_chosen_llama3.1_instruct_dpo_2048"
    # "ta_rejected_llama3.1_instruct_dpo_2048" 
        )  

# 原始日志文件名  
log_file="evaluation_log"  
counter=0
# 遍历模型列表，生成新的文件名  
for model in "${models[@]}"; do  
    if [ $counter -ge 3 ]; then  
        break  
    fi
    # 拼接模型名到log_file后  
    log_file="${log_file}_${model}"  

    counter=$((counter + 1)) 
done  
  
# 最终的文件名  
log_file="./eval_logs/${log_file}.txt" 

# 清空日志文件  
> "$log_file" 

# 循环调用单次调用脚本  
for model in "${models[@]}"  
do  
    # 获取当前时间并记录到日志文件中  
    start_time=$(date '+%Y-%m-%d %H:%M:%S')  
    start_seconds=$(date +%s)  
    echo "Starting evaluation for model $model at $start_time" >> "$log_file"  

    # 调用单次调用脚本并传入模型名称  
    bash scripts/examples/eval_tulu.sh "$model" 

    # 获取结束时间并记录到日志文件中  
    end_time=$(date '+%Y-%m-%d %H:%M:%S')  
    end_seconds=$(date +%s)  
      
    # 计算执行时间  
    duration=$((end_seconds - start_seconds))  
      
    echo "Completed evaluation for model $model at $end_time" >> "$log_file"  
    echo "Duration for model $model: ${duration} seconds" >> "$log_file"  
    # 调用完后暂停60秒  
    sleep 60  
done  
