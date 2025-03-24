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

zsh_installed="false"
tmux_installed="false"

if prompt_install "Would you like to do a full install (lazyvim)?"; then
   ./scripts/zsh-install.sh -y
   ./scripts/tmux-install.sh
   ./scripts/go-install.sh
   ./scripts/py-install.sh
   ./scripts/js-install.sh
   ./scripts/rust-install.sh
   ./scripts/nvim-install.sh
   ./scripts/setup-lazyvim.sh
   zsh_installed="true"
   tmux_installed="true"
elif prompt_install "Would you like to do a full install (jordanvim)?"; then
   ./scripts/zsh-install.sh -y
   ./scripts/tmux-install.sh
   ./scripts/go-install.sh
   ./scripts/py-install.sh
   ./scripts/js-install.sh
   ./scripts/rust-install.sh
   ./scripts/nvim-install.sh
   ./scripts/setup-jordanvim.sh
   zsh_installed="true"
   tmux_installed="true"
else
   # Prompt for Zsh installation
   if prompt_install "Would you like to install Zsh?"; then
      ./scripts/zsh-install.sh
      zsh_installed="true"
   fi

   # Prompt for Tmux installation
   if prompt_install "Would you like to install Tmux?"; then
      ./scripts/tmux-install.sh
      tmux_installed="true"
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
   if prompt_install "Would you like to install LazyVim?"; then
      ./scripts/setup-lazyvim.sh
   fi

   # Prompt for Neovim settings
   if prompt_install "Would you like to install Jordan's Neovim setup?"; then
      ./scripts/setup-jordanvim.sh
   fi

fi

echo ""
echo "Installation script completed."
if [ "$tmux_installed" == "true" ]; then
   echo "Tmux installed, run <leader>+I in tmux to install plugins"
fi
if [ "$zsh_installed" == "true" ]; then
   echo "Restart your terminal or run 'zsh' to start using Zsh."
fi
