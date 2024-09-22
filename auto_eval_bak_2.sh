#!/bin/bash  
set -x
# 模型名称列表  
# models=(
#     "tulu_lora_sft_base_template_8b" 
#     "tulu_v2_8b_base_template_dpo" 
#     "tulu_v2_8b_bsz64_default_template_dpo" 
#     "tulu_lora_sft_default_template_8b" 
#     "Meta-Llama-3.1-8B-Instruct")  
models=(
    # "ta_llama3_instruct_dpo_list_bsz1_trible_debug_v1"
    # "ta_llama3_instruct_dpo_list_bsz1_trible_debug_v1-1500"
    # "ta_rejected_tuluv2_dpo_2048_default_template_bsz1_acc8_v2_500"
    # "ta_rejected_tuluv2_dpo_2048_default_template_bsz1_acc8_v2_1000"
    # "ta_rejected_llama3.1_instruct_2048_default_template_v2-500"
    # "ta_rejected_llama3.1_instruct_2048_default_template_v2-1000"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v2"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v3"
    # "Meta-Llama-3.1-8B-Instruct"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_1000"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_1500"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_500"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug"
    # "ta_llama3_instruct_dpo_list_bsz1_trible_debug_v4"
    # "uf_llama3.1_instruct_dpo_2048_job"
    # "ta_llama3_instruct_dpo_list_bsz1_trible_debug_v5"
    # "ta_llama3_instruct_dpo_list_bsz1_trible_debug_v1"
    # "ta_llama3_instruct_dpo_list_bsz1_trible_debug_v5_1500"
    # "ta_llama3_instruct_dpo_list_bsz1_trible_debug_v2-1500"
    # "ta_llama3_instruct_dpo_list_bsz1_trible_debug_v1-1500"
    # "ta_llama3_instruct_dpo_list_bsz1_trible_debug_v4_1500"
    # "ta_rejected_llama3.1_instruct_2048_default_template_v2-1000"
    # "ta_chosen_llama3.1_instruct_dpo_2048"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v5_1500"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v10"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v10_1500"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v5"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v9"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v4-1500"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_1500"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v4"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v2"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v7"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug"
    # "ta_rejected_tuluv2_dpo_2048_default_template_bsz1_acc8_v2"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v7_1500"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v6_1500"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v6"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v3"
    # "tulu_v2_8b_2048_default_template_dpo"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v8_1500"
    # "tulu_2048_default_template_trible_uf_dpo"
    # "tulu_2048_default_template_trible_rejected_ta_dpo"
    # "tulu_2048_default_template_trible_chosen_ta_dpo_1500"
    # "tulu_2048_default_template_trible_chosen_ta_dpo"
    # "tulu_2048_default_template_trible_rejected_ta_dpo_1500"
    # "ta_chosen_llama3.1_instruct_dpo_2048_v2"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v15"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v15_1500"


    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v2_1500"
    "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v14"
    "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v11"
    "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v11_1500"
    "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v15"
    "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v15_1500"
    "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v14"
    "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v14-1500" 
    # "uf_llama3.1_instruct_dpo_2048_trible"
    # "uf_llama3.1_instruct_dpo_2048_trible_ta_chosen"
    # "ta_llama3_instruct_dpo_list_bsz1_trible_debug_v6"
    # "ta_llama3_instruct_dpo_list_bsz1_trible_debug_v9"
    # "ta_llama3_instruct_dpo_list_bsz1_trible_debug_v10"
    # "ta_llama3_instruct_dpo_list_bsz1_trible_debug_v11"
    # "ta_llama3_instruct_dpo_list_bsz1_trible_debug_v15"
    # "ta_llama3_instruct_dpo_list_bsz1_trible_debug_v15_1500"
    # "ta_chosen_tuluv2_dpo_2048_default_template_bsz1_acc8_v2"   
    # "ta_llama3_instruct_dpo_list_bsz1_trible_debug_v2-1500"
    # "ta_llama3_instruct_dpo_list_bsz1_trible_debug_v4"
    # "ta_llama3_instruct_dpo_list_bsz1_trible_debug_v4_1500"
    # "ta_llama3_instruct_dpo_list_bsz1_trible_debug_v5"
    # "ta_llama3_instruct_dpo_list_bsz1_trible_debug_v5_1500"
    # "tulu_uf_ta_v2_2048_default_template_dpo_1000"
    # "tulu_uf_ta_v2_2048_default_template_dpo_1500"
#   "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v9"
#   "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v9-1500"
#     "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v10"
#     "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v10_1500"
#     "tulu_v2_8b_2048_default_template_dpo"
#     "ta_llama3_instruct_dpo_list_bsz1_trible_debug_v1"
#     "ta_llama3_instruct_dpo_list_bsz1_trible_debug_v1-1500"

#     "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v11"
#     "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v11_1500"
#     "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v12"
#     "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v12_1500"
#     "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v13"
#     "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v13-1500"
#     "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v14"
#     "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v14-1500"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v4-1500"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v5_1500"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v6_1500"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v7_1500"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v8_1500"

    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v4"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v5"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v6"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v7"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v8"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug"
    # "ta_rejected_tuluv2_dpo_2048_default_template_bsz1_acc8_v2_500"
    # "ta_rejected_tuluv2_dpo_2048_default_template_bsz1_acc8_v2_1000"
    # "ta_rejected_llama3.1_instruct_2048_default_template_v2-500"
    # "ta_rejected_llama3.1_instruct_2048_default_template_v2-1000"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v2"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_v3"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_1000"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_1500"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug_500"
    # "tulu_v2_8b_default_template_dpo_list_bsz1_trible_debug"
    # "ta_v2_rejected_noneed_length_tuluv2_dpo_2048_default_template_bsz1_acc8_v2"
    # "ta_v2_rejected_noneed_tuluv2_dpo_2048_default_template_bsz1_acc8_v2"
    # "ta_v2_chosen_tuluv2_dpo_2048_default_template_bsz1_acc8_v2"
    # "ta_v2_chosen_tuluv2_dpo_2048_default_template_bsz1_acc8_v5"
    # "ta_v2_rejected_tuluv2_dpo_2048_default_template_bsz1_acc8_v5"
    # "ta_rejected_tuluv2_dpo_2048_default_template_bsz1_acc8_v4" 
    # "ta_v2_rejected_tuluv2_dpo_2048_default_template_bsz1_acc8" 
    # "ta_v2_rejected_tuluv2_dpo_2048_default_template_bsz1_acc8_v2"
    # "ta_v2_rejected_tuluv2_dpo_2048_default_template_bsz1_acc8_v3"
    # "ta_v2_rejected_tuluv2_dpo_2048_default_template_bsz1_acc8_v4"
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
    bash scripts/examples/eval_tulu_bak_2.sh "$model" 

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
