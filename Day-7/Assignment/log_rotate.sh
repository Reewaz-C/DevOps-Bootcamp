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

