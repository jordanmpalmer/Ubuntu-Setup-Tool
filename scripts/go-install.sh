#!/bin/bash

# Check if Go is installed
if command -v go &> /dev/null; then
    echo "Go is already installed: $(go version)"
else
    echo "Go is not installed. Proceeding with installation..."

    # Download and install Go
    if wget https://golang.org/dl/go1.24.1.linux-amd64.tar.gz; then
        echo "Downloaded Go successfully."
    else
        echo "Failed to download Go. Exiting."
        exit 1
    fi

    if sudo tar -C /usr/local -xzf go1.24.1.linux-amd64.tar.gz; then
        echo "Go installed successfully."
    else
        echo "Failed to install Go. Exiting."
        exit 1
    fi
    rm go1.24.1.linux-amd64.tar.gz
fi

# Automatically add Go to PATH in .zshrc
if ! grep -q 'export PATH=\$PATH:/usr/local/go/bin' ~/.zshrc; then
  echo '' >> ~/.zshrc
  echo '# Go Settings' >> ~/.zshrc
  echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.zshrc
  echo "Added Go to PATH in .zshrc."
else
  echo "Go is already in PATH in .zshrc."
fi

source ~/.zshrc

echo "Go installation script completed"
