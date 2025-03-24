#!/bin/bash


# Install Node.js and npm
if sudo apt install -y nodejs npm; then
    echo "Node.js and npm installed successfully."
else
    echo "Failed to install Node.js and npm. Exiting."
    exit 1
fi

# Add npm global package configuration to .zshrc if not already present
if ! grep -q 'NPM_PACKAGES="${HOME}/.npm-packages"' ~/.zshrc; then
   echo '' >> ~/.zshrc
   echo '# NPM settings' >> ~/.zshrc
   echo 'NPM_PACKAGES="${HOME}/.npm-packages"' >> ~/.zshrc
   echo 'export PATH="$PATH:$NPM_PACKAGES/bin"' >> ~/.zshrc
   echo 'export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"' >> ~/.zshrc
   echo "Added npm global package configuration to .zshrc."
else
   echo "npm global package configuration is already present in .zshrc."
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

source ~/.zshrc

echo "JavaScript and Node installation script completed"
