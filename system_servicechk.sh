#!/bin/bash

# List of services to check
SERVICES=("nginx" "mysql" "ssh" "apache2" "sftp" "postfix" "smtp" "mail" "vsftpd" "cron" "docker" "ufw")

# Check and restart services if not running
for SERVICE in "${SERVICES[@]}"; do
  if systemctl is-active --quiet $SERVICE; then
    echo "$SERVICE is running."
  else
    echo "$SERVICE is not running. Restarting..."
    sudo systemctl restart $SERVICE
  fi
done

echo "Service status check complete."
