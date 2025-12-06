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

