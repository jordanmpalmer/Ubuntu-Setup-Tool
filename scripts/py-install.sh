#!/bin/bash

# Install Python, related packages, and unzip
if sudo apt install -y python3 python3-pip python3-venv python3-dev build-essential libssl-dev libffi-dev unzip; then
    echo "Python and related packages, including unzip, installed successfully."
else
    echo "Failed to install Python and related packages. Exiting."
    exit 1
fi

mkdir -p ~/.config

source ~/.zshrc

echo "Python installation script completed"
