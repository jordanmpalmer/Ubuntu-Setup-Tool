# README

## Automated Installation

```sh
# Run installation script
./install.sh
```

## Manual Installation

#### Zsh setup
```sh
# Install zsh and set as default
sudo apt update
sudo apt install zsh
chsh -s $(which zsh)

sudo apt install lsd

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Add ohmyzsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
Then move .zshrc to home directory and source it with `source ~/.zshrc`

#### Tmux setup
```sh
# Install tmux
sudo apt install -y tmux

# Install tmux package manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

chmod +x ~/.tmux/plugins/tpm/tpm

tmux source-file ~/.tmux.conf
```

Use `<leader>+I` to install tmux plugins.
