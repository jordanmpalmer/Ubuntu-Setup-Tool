#!/bin/bash

sudo apt update 
sudo apt install -y ninja-build gettext cmake unzip curl ripgrep
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout v0.10.4
make CMAKE_BUILD_TYPE=Release
sudo make install
nvim --version

# Verify installations
if command -v stylua &> /dev/null; then
    echo "stylua installed successfully: $(stylua --version)"
else
    echo "stylua installation failed."
fi

echo "Neovim installation script completed"
