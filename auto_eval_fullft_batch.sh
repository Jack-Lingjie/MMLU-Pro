#!/bin/bash  
  
set -x  
  
# 激活 conda 环境  
# conda activate eval  
  
# 参数列表，每个元素包含 model_name, hyperparameter, 和 checkpoint，用逗号分隔  
PARAMS=(  
  # "glanchat_v2.1_8b_2048_default_template,fullft_lr5e6_e3,checkpoint-9918"
    "magpie_8b_2048_default_template,fullft_lr2e5_e2,sft,checkpoint-536"
  # "magpie_8b_2048_default_template/fullft_lr5e6_e3/sft/checkpoint-8500"  
  # "glanchat_v2.1_8b_2048_default_template_8500_dpo/fullft/dpo/checkpoint-2756"
  # "magpie_8b_2048_default_template/fullft_lr5e6_e3/sft/checkpoint-15468"
  # "glanchat_v2.1_8b_2048_default_template,fullft_lr5e6_e3,checkpoint-8500"  
  # "glan_v2_glanchat_v2_8b_2048_default_template,fullft_lr5e6_e3_fx,checkpoint-33000"   
)  
  
# 原始日志文件名  
LOG_FILE="evaluation_log"  
counter=0  
  
# 遍历参数列表，生成新的文件名  
for param in "${PARAMS[@]}"; do  
  if [ $counter -ge 3 ]; then  
    break  
  fi  
  # 拼接模型名到 log_file 后  
  LOG_FILE="${LOG_FILE}_${param}"  
  counter=$((counter + 1))  
done  
  
# 最终的文件名  
LOG_FILE="./eval_logs/${LOG_FILE}.txt"  
  
# 清空日志文件  
> "$LOG_FILE"  
  
# 循环调用单次调用脚本  
for PARAM in "${PARAMS[@]}"; do  
  # 记录开始时间  
  start_time=$(date +%s)  
    
  # 将参数分割为模型名称、超参数和 checkpoint  
  IFS=',' read -r model_name hyperparameter stage checkpoint <<< "$PARAM"  
    
  echo "执行参数: $model_name, $hyperparameter, $stage, $checkpoint" | tee -a $LOG_FILE  
    
  # 调用单次调用脚本并传入参数  
  bash scripts/examples/eval_tulu_fullft_batch.sh "$model_name" "$hyperparameter" "$stage" "$checkpoint" | tee -a "$LOG_FILE"  
    
  # 记录结束时间  
  end_time=$(date +%s)  
    
  # 计算执行时间  
  duration=$((end_time - start_time))  
  duration_minutes=$(echo "scale=2; $duration / 60" | bc)  
    
  echo "Completed evaluation for model $model_name at $(date '+%Y-%m-%d %H:%M:%S')" | tee -a "$LOG_FILE"  
  echo "Duration for model $model_name: $duration_minutes minutes" | tee -a "$LOG_FILE"  
  echo "----------------------------------------" | tee -a "$LOG_FILE"  
    
  # 调用完后暂停60秒  
  sleep 60  
done  
  
echo "所有任务已完成。" | tee -a "$LOG_FILE"  
