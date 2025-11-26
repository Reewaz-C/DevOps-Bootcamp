# Log Rotation and Cleanup Description

## Description

You need to implement a **log rotation system** on your server *where logs older than 30 days are deleted, and a new log file is created every day.* 
>This should be applied to application logs in `/var/log/app_logs/`.

### Requirements:

-   Create a script that checks for log files older than 30 days and removes them.
-   Ensure that a new log file is created every day with a timestamp.
-   Ensure that logs are compressed for archival.


## Step 1: Create log_rotate.sh script
```bash
#!/bin/bash


LOG_DIR="/var/log/myapp"
LOG_NAME="myapp.log"

# Keep logs for 7 days
RETENTION_DAYS=7

# Create log directory if missing
mkdir -p "$LOG_DIR"

# Today's log file
TODAY=$(date +%F)
TODAY_LOG="${LOG_DIR}/${LOG_NAME}.${TODAY}"

# 1) Create today's log file if missing
if [ ! -f "$TODAY_LOG" ]; then
    touch "$TODAY_LOG"
fi

# 2) Compress all log files except today
find "$LOG_DIR" -type f -name "${LOG_NAME}.*" ! -name "$(basename "$TODAY_LOG")" -exec gzip -f {} \;

# 3) Delete compressed logs older than the retention period
find "$LOG_DIR" -type f -name "${LOG_NAME}.*.gz" -mtime +$RETENTION_DAYS -exec rm -f {} \;

echo "Log rotation completed."
echo "Current log file: $TODAY_LOG"
```

## Step 2: Making the Script executable
```bash
chmod +x log_rotate.sh
```

## Step 3 : Schedule a CRON jon to make it run daily
```bash
sudo crontab -e
0 0 * * * /home/riwaz/DevOps-Bootcamp/Day-7/Assignment/log_rotate.sh
```

## Step 4: View Crontab
```bash
sudo crontab -l
```

## Screenshot
![log](../Img/log.png)
