#!/bin/bash

# Update the package list
echo "Updating package list..."
sudo apt update

# Install zsh
echo "Installing zsh, lsd, and unzip..."
sudo apt install -y zsh lsd unzip

# Change the default shell to zsh
chsh -s $(which zsh)

# Initialize INSTALL_OH_MY_ZSH
INSTALL_OH_MY_ZSH=""
DEFAULT_THEME="false"

# Check for the -y flag
while getopts "y" opt; do
    case $opt in
        y)
            INSTALL_OH_MY_ZSH="y"
            DEFAULT_THEME="true"
            ;;
        *)
            echo "Usage: $0 [-y]"
            exit 1
            ;;
    esac
done

# If -y is used, automatically set INSTALL_OH_MY_ZSH to "y"
if [[ "$INSTALL_OH_MY_ZSH" == "y" ]]; then
    echo "Automatically installing Oh My Zsh..."
else
    # Prompt for Oh My Zsh installation
    read -p "Would you like to install Oh My Zsh? [Y or N]: " INSTALL_OH_MY_ZSH
fi

if [[ "$INSTALL_OH_MY_ZSH" =~ ^[Yy]$ ]]; then
    # Install Oh My Zsh
    echo "Installing Oh My Zsh..."
    yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # Backup existing .zshrc and copy the new one
    if [ -f ~/.zshrc ]; then
        mv ~/.zshrc ~/.zshrc.bak
    fi

    echo "Copying new .zshrc from configs directory"
    cp configs/.zshrc ~ || { echo "Failed to copy .zshrc. Exiting."; exit 1; }

    # Add Oh My Zsh plugins
    echo "Adding Oh My Zsh plugins..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    # Verify installation
    if [ -d "$HOME/.oh-my-zsh" ]; then
       echo "Oh My Zsh installed successfully."
    else
       echo "Oh My Zsh installation failed."
    fi

    if [[ "$DEFAULT_THEME" == "false" ]]; then
        # Prompt for ZSH theme input
        read -p "Enter your desired Zsh theme (default: agnoster): " USER_THEME

        # Check if the user provided a theme
        if [ -n "$USER_THEME" ]; then
           # Update the .zshrc file with the new theme
           sed -i.bak "s/^ZSH_THEME=\".*\"/ZSH_THEME=\"$USER_THEME\"/" ~/.zshrc
           echo "ZSH theme has been set to '$USER_THEME'."
        else
           echo "Using agnoster as Zsh theme"
        fi
    fi
else
    echo "Skipping Oh My Zsh installation."
fi

# Verify installation
echo "Verifying installations..."
if command -v zsh &> /dev/null; then 
    echo "zsh installed successfully: $(zsh --version)"
else
    echo "zsh installation failed."
fi

echo "Zsh installation script completed"
