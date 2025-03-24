# Linux Setup Tool

The Linux Setup Tool (LST) is designed to allow for simple and efficient setup of Linux Ubuntu environments. This tool has options for some of the most common packages utilized on Linux. 

## Package Requirements

This package is designed to work within the Ubuntu operating system. It has been tested and verified with Ubuntu 24.04.01 LTS.

## Automated Installation

```sh
# Run installation script and follow prompts
./install.sh
```

if installing tmux, use `<leader>+I` to install tmux plugins.

if installing zsh, restart terminal or run 'zsh' post installation

## Install Options
- Full install of packages with LazyVim
- Full install of packages with JordanVim
- Individual packages, prompting install for each

### Packages
- Zsh (with or without Oh My Zsh)
- Tmux with TPM
- Go
- JavaScript with Node/NPM/NVM
- Python
- Rust with Cargo (and stylua)
- Neovim (built from source)
- LazyVim
- JordanVim
