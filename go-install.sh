#!/bin/bash

wget https://golang.org/dl/go1.24.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.24.1.linux-amd64.tar.gz

# export PATH=$PATH:/usr/local/go/bin  (ADD TO .zshrc)

# Verify installations
if command -v stylua &> /dev/null; then
    echo "stylua installed successfully: $(stylua --version)"
else
    echo "stylua installation failed."
fi

echo "Go installation script completed"
