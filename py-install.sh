#!/bin/bash

sudo apt install python3 python3-pip python3-venv python3-dev build-essential libssl-dev libffi-dev

sudo apt install unzip
# export PATH=$PATH:/usr/local/go/bin  (ADD TO .zshrc)

# Verify installations
if command -v stylua &> /dev/null; then
    echo "stylua installed successfully: $(stylua --version)"
else
    echo "stylua installation failed."
fi

echo "Python installation script completed"
