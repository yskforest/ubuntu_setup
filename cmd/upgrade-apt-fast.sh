#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Check if apt-fast is installed
if ! command -v apt-fast >/dev/null 2>&1; then
    echo "apt-fast is not installed. Installing apt-fast..."
    sudo add-apt-repository -y ppa:apt-fast/stable
    sudo apt update
    sudo apt install -y apt-fast
    echo "apt-fast installation completed."
fi

echo "Updating package lists..."
sudo apt-fast update

echo "Upgrading installed packages..."
sudo apt-fast -y upgrade

# echo "Removing unnecessary packages..."
# sudo apt-fast -y autoremove

# echo "Cleaning up package cache..."
# sudo apt-fast -y autoclean

echo "System update and cleanup completed successfully."
