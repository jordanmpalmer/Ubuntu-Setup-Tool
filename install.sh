#!/bin/bash

# Function to prompt for installation
prompt_install() {
    read -p "$1 [Y or N]: " choice
    case "$choice" in
        [Yy]* ) return 0;;  # User wants to install
        [Nn]* ) return 1;;  # User does not want to install
        * ) echo "Please answer Y or N." && prompt_install "$1";;  # Invalid input, prompt again
    esac
}

# Prompt for Zsh installation
if prompt_install "Would you like to install Zsh?"; then
    ./scripts/zsh-install.sh
fi

# Prompt for Tmux installation
if prompt_install "Would you like to install Tmux?"; then
    ./scripts/tmux-install.sh
fi

# Prompt for Go installation
if prompt_install "Would you like to install Go?"; then
    ./scripts/go-install.sh
fi

# Prompt for Python installation
if prompt_install "Would you like to install Python?"; then
    ./scripts/py-install.sh
fi

# Prompt for JavaScript installation
if prompt_install "Would you like to install JavaScript tools?"; then
    ./scripts/js-install.sh
fi

# Prompt for Rust installation
if prompt_install "Would you like to install Rust?"; then
    ./scripts/rust-install.sh
fi

# Prompt for Neovim installation
if prompt_install "Would you like to install Neovim?"; then
    ./scripts/nvim-install.sh
fi

# Prompt for Neovim settings
if prompt_install "Would you like to install Jordan's Neovim setup?"; then
    ./scripts/nvim-setup.sh
fi

echo "Installation script completed."
