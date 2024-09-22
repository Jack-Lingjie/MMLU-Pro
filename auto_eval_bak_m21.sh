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
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v14"
    "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v11"
    "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v11_1500"
    "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v15"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v15_1500"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v14"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v14-1500" 
    # "uf_llama3.1_instruct_dpo_2048_trible"
    # "uf_llama3.1_instruct_dpo_2048_trible_ta_chosen"
    # "ta_llama3_instruct_dpo_list_bsz1_trible_debug_v6"
    # "ta_llama3_instruct_dpo_list_bsz1_trible_debug_v9"
    # "ta_llama3_instruct_dpo_list_bsz1_trible_debug_v10"
    # "ta_llama3_instruct_dpo_list_bsz1_trible_debug_v11"
    # "ta_llama3_instruct_dpo_list_bsz1_trible_debug_v15"
    # "ta_llama3_instruct_dpo_list_bsz1_trible_debug_v15_1500"
    # "ta_chosen_tuluv2_dpo_2048_default_template_bsz1_acc8_v2"
    # "uf_llama3.1_instruct_dpo_2048_trible_ta_rejected"    
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
log_file2="/mnt/lingjiejiang/textual_aesthetics/logs/logs/${log_file}.txt" 
log_file="./eval_logs/${log_file}.txt" 

# 清空日志文件  
> "$log_file" 
> "$log_file2"
# 循环调用单次调用脚本  
for model in "${models[@]}"  
do  
    # 获取当前时间并记录到日志文件中  
    start_time=$(date '+%Y-%m-%d %H:%M:%S')  
    start_seconds=$(date +%s)  
    echo "Starting evaluation for model $model at $start_time" | tee -a  "$log_file"  "$log_file2"

    # 调用单次调用脚本并传入模型名称  
    bash scripts/examples/eval_tulu_bak_m2_1.sh "$model" | tee -a  "$log_file"  "$log_file2"

    # 获取结束时间并记录到日志文件中  
    end_time=$(date '+%Y-%m-%d %H:%M:%S')  
    end_seconds=$(date +%s)  
      
    # 计算执行时间  
    duration=$((end_seconds - start_seconds))  
      
    echo "Completed evaluation for model $model at $end_time" | tee -a  "$log_file"  "$log_file2"
    echo "Duration for model $model: ${duration} seconds" | tee -a  "$log_file"  "$log_file2" 
    # 调用完后暂停60秒  
    sleep 60  
done  