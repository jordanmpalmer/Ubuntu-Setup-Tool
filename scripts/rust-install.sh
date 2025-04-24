#!/bin/bash

# Check if Rust is installed
if command -v rustc &> /dev/null; then
    echo "Rust is already installed: $(rustc --version)"
else
    echo "Rust is not installed. Proceeding with installation..."

    # Install Rust and Cargo
    echo "Installing Rust and Cargo..."
    if curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh; then
        echo "Rust and Cargo installed successfully."
    else
        echo "Failed to install Rust and Cargo. Exiting."
        exit 1
    fi

    # Configure the current shell to use Cargo
    echo "Configuring shell for Cargo..."
    if [ -s "$HOME/.cargo/env" ]; then
        source "$HOME/.cargo/env"
        echo "Shell configured for Cargo."
    else
        echo "Failed to configure shell for Cargo. Exiting."
        exit 1
    fi
fi

# Install stylua using Cargo
echo "Installing stylua using Cargo..."
if cargo install stylua; then
    echo "stylua installed successfully."
else
    echo "Failed to install stylua. Exiting."
    exit 1
fi

# Determine the current shell
current_shell=$(basename "$SHELL")

# Define the line to add to the configuration file
line_to_add='export PATH="$HOME/.cargo/bin:$PATH"'

# Add the line to the appropriate configuration file
if [ -f ~/.zshrc ]; then
        if ! grep -qF "$line_to_add" ~/.zshrc; then
            echo '' >> ~/.zshrc
            echo '# Rust settings' >> ~/.zshrc
            echo "$line_to_add" >> ~/.zshrc
            echo '. "$HOME/.cargo/env"' >> ~/.zshrc
            echo 'source $HOME/.cargo/env' >> ~/.zshrc
            echo "Added Cargo to PATH in .zshrc."
        else
            echo "Cargo is already in PATH in .zshrc."
        fi
        source ~/.zshrc
elif [ -f ~/.bashrc ]; then
        if ! grep -qF "$line_to_add" ~/.bashrc; then
            echo '' >> ~/.bashrc
            echo '# Rust settings' >> ~/.bashrc
            echo "$line_to_add" >> ~/.bashrc
            echo '. "$HOME/.cargo/env"' >> ~/.bashrc
            echo 'source $HOME/.cargo/env' >> ~/.bashrc
            echo "Added Cargo to PATH in .bashrc."
        else
            echo "Cargo is already in PATH in .bashrc."
        fi
        source ~/.bashrc
else
        echo "Unsupported shell: $current_shell"
        exit 1
fi

echo "Rust installation script completed"
