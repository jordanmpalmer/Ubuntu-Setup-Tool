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
git clone https://github.com/LazyVim/starter || {
  echo "Failed to clone repository"
  exit 1
}

mv starter nvim || {
   echo "Failed to change starter name to nvim"
   exit 1
}

rm -rf ~/.config/nvim/.git

cd

echo "Installation and setup completed successfully."
