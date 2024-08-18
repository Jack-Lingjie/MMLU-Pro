#!/bin/bash  
set -x

# 模型名称列表  
models=(
    "tulu-2-7b"  
    "tulu-2-dpo-7b"
    )  

# 原始日志文件名  
log_file="evaluation_log"  
  
# 遍历模型列表，生成新的文件名  
for model in "${models[@]}"; do  
    # 拼接模型名到log_file后  
    log_file="${log_file}_${model}"  
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
