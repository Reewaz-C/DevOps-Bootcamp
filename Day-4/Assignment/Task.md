# Task: Tracking top CPU consuming processes using Bash Scripting

## 1. creating bash file

```bash
vim CPU.sh
```

## 2. Creating the script

shebang defines which interpreter to run our script.

```bash
#!/bin/bash
```

## 3. Defining a variable called CPU

Here we have use ps command to sort by CPU usage and piped wirg sed -n '2p' which selects line 2

```bash
CPU=$(ps aux --sort=-%cpu | sed -n '2p')
```

## 4. Extracting PID, Process name and CPU Usage


```bash
pid=$(echo $CPU | awk '{print $2}'
``` 

$2 extracts the PID
    
```bash
CPU_usage=$(echo $CPU | awk '{print $3}')
```

$3 Extracts process

```bash
process=$(echo $CPU | awk '{print $11}')
```

$11 Extracts CPU usage

## 5. Logging to cpu_report.txt file

```bash
echo "PID: $pid | Process: $process | CPU: $CPU_usage" > cpu_report.txt
```

