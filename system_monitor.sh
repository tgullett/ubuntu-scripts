#!/bin/bash

# Log file
LOG_FILE="/var/log/system_performance.log"

# Log system performance data
echo "Logging system performance data..."
while true; do
  echo "Timestamp: $(date)" >> $LOG_FILE
  echo "CPU Usage:" >> $LOG_FILE
  top -b -n1 | grep "Cpu(s)" >> $LOG_FILE
  echo "Memory Usage:" >> $LOG_FILE
  free -m >> $LOG_FILE
  echo "----------------------------" >> $LOG_FILE
  sleep 60
done
