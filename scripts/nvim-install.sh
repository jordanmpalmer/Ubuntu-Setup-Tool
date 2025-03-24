#!/bin/bash

# Update package list and install dependencies
sudo apt update 
sudo apt install -y ninja-build gettext cmake unzip curl ripgrep git

# Clone the Neovim repository
git clone https://github.com/neovim/neovim.git
cd neovim

# Fetch the latest tags
git fetch --tags

# Set the default version to 'stable'
default_version="stable"

# Prompt user for the version of Neovim to install
read -p "Enter the version of Neovim to install (e.g., v0.10.4) [default: $default_version]: " version

# Use the default version if no input is provided
version=${version:-$default_version}

# Check if the specified version exists
if git rev-parse "$version" >/dev/null 2>&1; then
    git checkout "$version"
else
    echo "Version $version does not exist. Exiting."
    exit 1
fi

# Build and install Neovim
make CMAKE_BUILD_TYPE=Release
sudo make install

# Verify installation
if command -v nvim &> /dev/null; then
    echo "nvim installed successfully: $(nvim --version)"
else
    echo "nvim installation failed."
fi

# Remove the Neovim repository
cd ..
rm -rf neovim
mkdir ~/.config

echo "Neovim installation script completed"
