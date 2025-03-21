#!/bin/bash

# Update the package list
echo "Updating package list..."
sudo apt update

# Install tmux
echo "Installing tmux..."
sudo apt install -y tmux

# Install tmux package manager
echo "Installing tmux plugin manager..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
chmod +x ~/.tmux/plugins/tpm/tpm

# Move .tmux.conf to home directory
mv ~/.tmux.conf ~/.tmux.conf.bak
cp .tmux.conf ~

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
