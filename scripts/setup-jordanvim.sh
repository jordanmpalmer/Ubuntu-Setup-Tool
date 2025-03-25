#!/bin/bash

# Create the necessary directory for configuration
mkdir -p ~/.config

if [ -d ~/.config/nvim ]; then
   # If nvim.bak already exists, remove it
   if [ -d ~/.config/nvim.bak ]; then
     rm -rf ~/.config/nvim.bak
   fi
   mv ~/.config/nvim{,.bak}
fi

cd ~/.config || {
  echo "Failed to change directory to ~/.config"
  exit 1
}

# Clone the nvim repository
git clone https://github.com/jordanmpalmer/JordanVim || {
  echo "Failed to clone repository"
  exit 1
}

mv JordanVim nvim || {
   echo "Failed to change JordanVim name to nvim"
   exit 1
}

cd

# Download win32yank
wget https://github.com/equalsraf/win32yank/releases/download/v0.1.1/win32yank-x64.zip || {
  echo "Failed to download win32yank"
  exit 1
}

# Unzip the downloaded file
unzip win32yank-x64.zip || {
  echo "Failed to unzip win32yank"
  exit 1
}

# Create the target directory for win32yank
mkdir -p "/mnt/c/Users/Public/WSLPlugins"

# Move win32yank.exe to the target directory
mv win32yank.exe "/mnt/c/Users/Public/WSLPlugins/win32yank.exe" || {
  echo "Failed to move win32yank.exe"
  exit 1
}

# Clean up downloaded files
rm win32yank-x64.zip
rm -f README.md LICENSE # Use -f to avoid errors if files do not exist

echo "Installation and setup completed successfully."
