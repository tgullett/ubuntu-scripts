#!/bin/bash

# Update and upgrade the system
echo "Updating and upgrading the system..."
sudo apt update && sudo apt upgrade -y

# Clean up unused packages and dependencies
echo "Cleaning up unused packages..."
sudo apt autoremove -y
sudo apt clean

echo "System update and upgrade complete."
