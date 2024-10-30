## README

Install to setup zsh
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

For tmux plugins
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

chmod +x ~/.tmux/plugins/tpm/tpm

tmux source-file ~/.tmux.conf
```

Use <leader>+Shift+I to install tmux plugins.
