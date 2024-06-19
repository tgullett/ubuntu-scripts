#!/bin/bash

# Log file to rotate
LOG_FILE="/var/log/your_log_file.log"
# Backup directory
BACKUP_DIR="/var/log/backup"

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Rotate log file
echo "Rotating log file $LOG_FILE..."
mv $LOG_FILE $BACKUP_DIR/your_log_file_$(date +%Y%m%d%H%M%S).log
touch $LOG_FILE

echo "Log rotation complete."
