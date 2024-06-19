#!/bin/bash

# Disk usage threshold percentage
THRESHOLD=80

# Check disk usage and alert if usage exceeds threshold
echo "Checking disk usage..."
df -h | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output;
do
  usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1  )
  partition=$(echo $output | awk '{ print $2 }' )
  if [ $usep -ge $THRESHOLD ]; then
    echo "Warning: $partition usage is at $usep%."
  fi
done

echo "Disk usage check complete."
