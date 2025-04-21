#!/bin/bash

# Script to configure Netplan interactively

read -p "Enter network interface (e.g., eth0, ens33): " interface
read -p "Enter IP address (e.g., 192.168.1.100/24): " ip_address
read -p "Enter gateway (e.g., 192.168.1.1): " gateway
read -p "Enter DNS servers (comma-separated, e.g., 8.8.8.8,8.8.4.4): " dns_servers

netplan_file="/etc/netplan/01-netcfg.yaml"

sudo bash -c "cat > $netplan_file <<EOL
network:
  version: 2
  ethernets:
    $interface:
      dhcp4: no
      addresses: [$ip_address]
      gateway4: $gateway
      nameservers:
          addresses: [$dns_servers]
EOL"

sudo netplan apply

echo "Netplan configuration applied."
