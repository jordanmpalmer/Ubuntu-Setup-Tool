#!/bin/bash

# Update the package list
echo "Updating package list..."
sudo apt update

# Install zsh
echo "Installing zsh..."
sudo apt install -y zsh
chsh -s $(which zsh)
sudo apt install -y lsd unzip

# Install ohmyzsh
echo "Installing Oh My Zsh..."
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Move .zshrc to home directory
mv ~/.zshrc ~/.zshrc.bak
cp .zshrc ~

# Add ohmyzsh plugins
echo "Adding Oh My Zsh plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Verify installations
echo "Verifying installations..."
if command -v zsh &> /dev/null; then 
	echo "zsh installed successfully: $(zsh --version)"
else
	echo "zsh installation failed."
fi

if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh installed successfully."
else
    echo "Oh My Zsh installation failed."
fi

echo "Zsh installation script completed"

# Start a new Zsh session
exec zsh
