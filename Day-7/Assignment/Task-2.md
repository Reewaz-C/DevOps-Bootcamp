# Log Rotation and Cleanup Description

## Description

You need to implement a **log rotation system** on your server *where logs older than 30 days are deleted, and a new log file is created every day.* 
>This should be applied to application logs in `/var/log/myapp/`.

### Requirements:

-   Create a script that checks for log files older than 30 days and removes them.
-   Ensure that a new log file is created every day with a timestamp.
-   Ensure that logs are compressed for archival.


## Step 1: Create log_rotate.sh script
```bash
#!/bin/bash

# Directory for log files
LOG_DIR="/var/log/myapp"
LOG_NAME="myapp"

# Retention period in days
RETENTION_DAYS=30

# Ensure the log directory exists
mkdir -p "$LOG_DIR"

# Today's date (YYYY-MM-DD)
TODAY=$(date +%F)

# Today's log file
TODAY_LOG="${LOG_DIR}/${LOG_NAME}_${TODAY}.log"

#############################
# 1) Delete logs older than retention
#############################
find "$LOG_DIR" -type f -name "${LOG_NAME}_*.log"    -mtime +$RETENTION_DAYS -exec rm -f {} \;
find "$LOG_DIR" -type f -name "${LOG_NAME}_*.log.gz" -mtime +$RETENTION_DAYS -exec rm -f {} \;

#############################
# 2) Compress old log files (except today's)
#############################
find "$LOG_DIR" -type f -name "${LOG_NAME}_*.log" ! -name "$(basename "$TODAY_LOG")" -exec gzip -f {} \;

#############################
# 3) Ensure today's log file exists
#############################
if [ ! -f "$TODAY_LOG" ]; then
    touch "$TODAY_LOG"
fi

echo "Log rotation complete."
echo "Today's log: $TODAY_LOG"

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
