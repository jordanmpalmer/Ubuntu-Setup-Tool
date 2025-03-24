# Linux Setup Tool

The **Linux Setup Tool (LST)** is designed to facilitate the simple and efficient setup of Linux Ubuntu environments. This tool provides options for installing some of the most commonly used packages in the Linux ecosystem.

## Package Requirements

The Linux Setup Tool is specifically designed to work within the Ubuntu operating system. It has been tested and verified with **Ubuntu 24.04.01 LTS**.

## Automated Installation

To install the necessary packages, simply run the installation script and follow the prompts:

```sh
./install.sh
```

### Post-Installation Instructions

- **For Tmux**: After installation, use `<leader> + I` within tmux to install Tmux plugins.
- **For Zsh**: Restart your terminal or run `zsh` to activate the new shell after installation.

## Install Options
The Linux Setup Tool offers several installation options:

- **Full installation** of packages with **LazyVim**
- **Full installation** of packages with **JordanVim**
- **Individual package installations**, prompting for confirmation before each installation

### Available Packages

The following packages can be installed using the Linux Setup Tool:

- **Zsh** (with or without Oh My Zsh)
- **Tmux** (with Tmux Plugin Manager)
- **Go**
- **JavaScript** (with Node.js, NPM, and NVM)
- **Python**
- **Rust** (with Cargo and Stylua)
- **Neovim** (built from source)
- **LazyVim**
- **JordanVim**
