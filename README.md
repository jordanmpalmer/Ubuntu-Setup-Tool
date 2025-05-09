# Ubuntu Setup Tool

The **Ubuntu Setup Tool (UST)** is designed to facilitate the simple and efficient setup of Linux Ubuntu environments. This tool provides options for installing some of the most commonly used packages in the Linux ecosystem.

## Package Requirements

The Ubuntu Setup Tool is specifically designed to work within the Ubuntu operating system. It has been tested and verified with **Ubuntu 24.04.01 LTS**.

## Automated Installation

To install the necessary packages, simply run the installation script and follow the prompts:

```sh
./install.sh
```

### Post-Installation Instructions

- **For Tmux**: After installation, use `<leader> + I` within tmux to install Tmux plugins (default `<leader>` is C-space found in `~/.tmux.conf`).
- **For Zsh**: Restart your terminal or run `zsh` to activate the new shell after installation.

## Install Options

The Ubuntu Setup Tool offers several installation options:

- **Full installation** of packages with **[LazyVim](https://github.com/LazyVim/LazyVim)**
- **Full installation** of packages with **[JordanVim](https://github.com/jordanmpalmer/JordanVim)**
- **Individual package installations**, prompting for confirmation before each installation

### Available Packages

The following packages can be installed using the Ubuntu Setup Tool:

- **Zsh** (with or without [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh))
- **[Tmux](https://github.com/tmux/tmux)** (with Tmux Plugin Manager)
- **[Go](https://go.dev/)**
- **[JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript)** (with Node.js, NPM, and NVM)
- **[Python](https://www.python.org/)** (with pip)
- **[Rust](https://www.rust-lang.org/)** (with Cargo and Stylua)
- **[Neovim](https://github.com/neovim/neovim)** (built from source)
- **[LazyVim](https://github.com/LazyVim/LazyVim)**
- **[JordanVim](https://github.com/jordanmpalmer/JordanVim)**
