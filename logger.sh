#!/bin/bash
FILE=./log.csv
TIME_INT=2

if [ "$#" -ne 2 ]; then
    echo "Incorrect number of arguments, provided $#"
    echo "Format: logger.sh <log file to write to> <interval in seconds>"
    exit 1
fi

FILE=$1
TIME_INT=$2

echo "Unix Timestamp, GPU Utilization (%), GPU Temperature (C)" | tee $FILE
while true
do
    TIME=$(date +%s)
    GPU_UTIL=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits)
    GPU_TEMP=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)
    echo "$TIME,$GPU_UTIL,$GPU_TEMP" | tee -a $FILE

    sleep $TIME_INT
done
