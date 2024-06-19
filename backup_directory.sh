#!/bin/bash

# Directory to backup
SOURCE_DIR="/path/to/source"
# Backup directory
BACKUP_DIR="/path/to/backup"
# Create backup file name with timestamp
BACKUP_FILE="$BACKUP_DIR/backup_$(date +%Y%m%d%H%M%S).tar.gz"

# Create a backup
echo "Creating backup of $SOURCE_DIR..."
tar -czf $BACKUP_FILE $SOURCE_DIR

echo "Backup created at $BACKUP_FILE."
