#!/bin/bash

# Check if tmux is installed
if command -v tmux &> /dev/null; then
    echo "tmux is already installed: $(tmux -V)"
else
    echo "tmux is not installed. Proceeding with installation..."

    # Update the package list
    echo "Updating package list..."
    if sudo apt update; then
        echo "Package list updated successfully."
    else
        echo "Failed to update package list. Exiting."
        exit 1
    fi

    # Install tmux
    echo "Installing tmux..."
    if sudo apt install -y tmux; then
        echo "tmux installed successfully."
    else
        echo "Failed to install tmux. Exiting."
        exit 1
    fi
fi

# Check if TPM (tmux plugin manager) is installed
if [ -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "TPM is already installed."
else
    echo "TPM is not installed. Proceeding with installation..."

    # Install tmux plugin manager
    echo "Installing tmux plugin manager..."
    if git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm; then
        echo "TPM installed successfully."
    else
        echo "Failed to install TPM. Exiting."
        exit 1
    fi

    chmod +x ~/.tmux/plugins/tpm/tpm
fi

# Move .tmux.conf to home directory
if [ -f ~/.tmux.conf ]; then
    mv ~/.tmux.conf ~/.tmux.conf.bak
    echo "Backed up existing .tmux.conf to .tmux.conf.bak."
fi

# Copy the new .tmux.conf from the current directory
if cp .tmux.conf ~; then
    echo ".tmux.conf copied to home directory."
else
    echo "Failed to copy .tmux.conf. Exiting."
    exit 1
fi

# Source tmux configuration
tmux source-file ~/.tmux.conf

# Verify installations
if command -v tmux &> /dev/null; then 
    echo "tmux installed successfully: $(tmux -V)"
else
    echo "tmux installation failed."
fi

if [ -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "TPM installed successfully."
else
    echo "TPM installation failed."
fi

echo "Tmux installation script completed, run <leader>+I in tmux to install plugins"
