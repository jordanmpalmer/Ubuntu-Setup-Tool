#!/bin/bash

# Create the necessary directory for configuration
mkdir -p ~/.config

cd ~/.config || { echo "Failed to change directory to ~/.config"; exit 1; }

# Clone the nvim repository
git clone https://github.com/jordanmpalmer/nvim.git || { echo "Failed to clone repository"; exit 1; }

cd nvim || { echo "Failed to change directory to nvim"; exit 1; }

# Switch to the specified branch
git switch 03-Work-Environment || { echo "Failed to switch branch"; exit 1; }

# Prompt for user input
read -p "Enter your Boeing account name (e.g. er487n): " NEW_VALUE

# Check if the input is empty
if [ -z "$NEW_VALUE" ]; then
    echo "Error: Input cannot be empty."
    exit 1
fi

# Define the path to the init.lua file
INIT_FILE="$HOME/.config/nvim/init.lua"

# Replace occurrences of "vn411f" with the user input in the init.lua file
sed -i "s/vn411f/$NEW_VALUE/g" "$INIT_FILE" || { echo "Failed to replace text in $INIT_FILE"; exit 1; }

echo "'vn411f' has been replaced with '$NEW_VALUE' in $INIT_FILE."

cd || { echo "Failed to return to home directory"; exit 1; }

# Download win32yank
wget https://github.com/equalsraf/win32yank/releases/download/v0.1.1/win32yank-x64.zip || { echo "Failed to download win32yank"; exit 1; }

# Unzip the downloaded file
unzip win32yank-x64.zip || { echo "Failed to unzip win32yank"; exit 1; }

# Create the target directory for win32yank
mkdir -p "/mnt/c/Users/$NEW_VALUE/Documents/WSLPlugins"

# Move win32yank.exe to the target directory
mv win32yank.exe "/mnt/c/Users/$NEW_VALUE/Documents/WSLPlugins/win32yank.exe" || { echo "Failed to move win32yank.exe"; exit 1; }

# Clean up downloaded files
rm win32yank-x64.zip
rm -f README.md LICENSE  # Use -f to avoid errors if files do not exist

echo "Installation and setup completed successfully."
