#!/bin/bash

sudo apt install nodejs npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# Verify installations
if command -v stylua &> /dev/null; then
    echo "stylua installed successfully: $(stylua --version)"
else
    echo "stylua installation failed."
fi

echo "JavaScript and Node installation script completed"
