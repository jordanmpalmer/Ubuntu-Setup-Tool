#!/bin/bash

# Install Rust and Cargo
echo "Installing Rust and Cargo..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Configure the current shell to use Cargo
echo "Configuring shell for Cargo..."
source $HOME/.cargo/env

# Verify installations
if command -v stylua &> /dev/null; then
    echo "stylua installed successfully: $(stylua --version)"
else
    echo "stylua installation failed."
fi

echo "Rust installation script completed"
