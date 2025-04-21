#!/bin/bash

# Install unattended-upgrades package
echo "Installing unattended-upgrades..."
sudo apt install unattended-upgrades -y

# Enable automatic updates
echo "Configuring automatic updates..."
sudo dpkg-reconfigure --priority=low unattended-upgrades

echo "Automatic security updates configured."
