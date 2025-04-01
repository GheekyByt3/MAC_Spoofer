#!/bin/bash

# Checks root privileges
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root. Use sudo to execute it."
   exit 1
fi

# Checks if macchanger is installed
if ! command -v macchanger &> /dev/null; then
    echo "macchanger is not installed. Please install it and try again."
    exit 1
fi

# Checks if the interface and MAC address are provided as arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <interface> <new_mac_address>"
    echo "Example: $0 eth0 E8:C6:18:D3:28:33"
    exit 1
fi

INTERFACE=$1
NEW_MAC=$2

# Check if the specified interface exists
if [ ! -d "/sys/class/net/$INTERFACE" ]; then
    echo "Error: Network interface '$INTERFACE' does not exist."
    exit 1
fi

# Brings the network  interface down
sudo ifconfig $INTERFACE down

# Changes the MAC address
echo # Adds an empty line
sudo macchanger -m $NEW_MAC $INTERFACE

# Brings the network interface back up
echo # Adds an empty line
sudo ifconfig $INTERFACE up

echo "MAC address for $INTERFACE successfully changed to $NEW_MAC."
