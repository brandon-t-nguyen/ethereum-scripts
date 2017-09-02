#!/bin/bash
TIME_INT=2
FILE=./log.csv

echo "Unix Timestamp, GPU Utilization (%), GPU Temperature (C)" | tee $FILE
while true
do
    TIME=$(date +%s)
    GPU_UTIL=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits)
    GPU_TEMP=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)
    echo "$TIME,$GPU_UTIL,$GPU_TEMP" | tee -a $FILE

    sleep $TIME_INT
done
