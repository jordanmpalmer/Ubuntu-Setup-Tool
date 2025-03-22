#!/bin/bash

# Check if Python is installed
if command -v python3 &> /dev/null; then
    echo "Python is already installed: $(python3 --version)"
else
    echo "Python is not installed. Proceeding with installation..."

    # Install Python, related packages, and unzip
    if sudo apt install -y python3 python3-pip python3-venv python3-dev build-essential libssl-dev libffi-dev unzip; then
        echo "Python and related packages, including unzip, installed successfully."
    else
        echo "Failed to install Python and related packages. Exiting."
        exit 1
    fi
    
fi

mkdir -p ~/.config


echo "Python installation script completed"
