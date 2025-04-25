#!/bin/bash

# Install Python, related packages, and unzip
if sudo apt install -y dotnet-sdk-8.0; then
    echo "C# installed successfully."
else
    echo "Failed to install C#. Exiting."
    exit 1
fi

if [ -f ~/.zshrc ]; then
	source ~/.zshrc
elif [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

echo "C# installation script completed"
