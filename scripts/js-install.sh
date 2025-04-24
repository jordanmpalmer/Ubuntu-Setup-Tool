#!/bin/bash


# Install Node.js and npm
if sudo apt install -y nodejs npm; then
    echo "Node.js and npm installed successfully."
else
    echo "Failed to install Node.js and npm. Exiting."
    exit 1
fi

# Determine the current shell
current_shell=$(basename "$SHELL")

# Define the line to add to the configuration file
line_to_add='NPM_PACKAGES="${HOME}/.npm-packages"'

# Add the line to the appropriate configuration file
if [ -f ~/.zshrc ]; then
        if ! grep -qF "$line_to_add" ~/.zshrc; then
            echo '' >> ~/.zshrc
            echo '# NPM settings' >> ~/.zshrc
            echo "$line_to_add" >> ~/.zshrc
            echo 'export PATH="$PATH:$NPM_PACKAGES/bin"' >> ~/.zshrc
            echo 'export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"' >> ~/.zshrc
            echo "Added npm global package configuration to .zshrc."
        else
            echo "npm global package configuration is already present in .zshrc."
        fi
        source ~/.zshrc
elif [ -f ~/.bashrc ]; then
        if ! grep -qF "$line_to_add" ~/.bashrc; then
            echo '' >> ~/.bashrc
            echo '# NPM settings' >> ~/.bashrc
            echo "$line_to_add" >> ~/.bashrc
            echo 'export PATH="$PATH:$NPM_PACKAGES/bin"' >> ~/.bashrc
            echo 'export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"' >> ~/.bashrc
            echo "Added npm global package configuration to .bashrc."
        else
            echo "npm global package configuration is already present in .bashrc."
        fi
        source ~/.bashrc
else
        echo "Unsupported shell: $current_shell"
        exit 1
fi

# Check if NVM is installed
if command -v nvm &> /dev/null; then
    echo "NVM is already installed: $(nvm --version)"
else
    echo "NVM is not installed. Proceeding with installation..."

    # Download and install NVM
    if curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash; then
        echo "NVM installed successfully."
    else
        echo "Failed to install NVM. Exiting."
        exit 1
    fi

    # Load NVM into the current shell session
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
fi

echo "JavaScript and Node installation script completed"
