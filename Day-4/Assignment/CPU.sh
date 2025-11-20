#!/bin/bash

CPU=$(ps aux --sort=-%cpu | sed -n '2p')

pid=$(echo $CPU | awk '{print $2}')

CPU_usage=$(echo $CPU | awk '{print $3}')

process=$(echo $CPU | awk '{print $11}')


echo "PID: $pid | Process: $process | CPU: $CPU_usage" > cpu_report.txt

