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

# Determine the current shell
current_shell=$(basename "$SHELL")

# Define the line to add to the configuration file
line_to_add='export PATH=$PATH:/usr/local/go/bin'

# Add the line to the appropriate configuration file
if [ -f ~/zshrc ]; then
        if ! grep -qF "$line_to_add" ~/.zshrc; then
            echo '' >> ~/.zshrc
            echo '# Go Settings' >> ~/.zshrc
            echo "$line_to_add" >> ~/.zshrc
            echo "Added Go to PATH in .zshrc."
        else
            echo "Go is already in PATH in .zshrc."
        fi
        source ~/.zshrc
elif [ -f ~/.bashrc ]; then
	if ! grep -qF "$line_to_add" ~/.bashrc; then
            echo '' >> ~/.bashrc
            echo '# Go Settings' >> ~/.bashrc
            echo "$line_to_add" >> ~/.bashrc
            echo "Added Go to PATH in .bashrc."
        else
            echo "Go is already in PATH in .bashrc."
        fi
        source ~/.bashrc
else
        echo "Unsupported shell: $current_shell"
        exit 1
fi

echo "Go installation script completed"
