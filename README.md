# Neovim

This repository contains my Neovim settings.

## Pre-requisites

- Node.js for language servers and code completion.
- ripgrep and fd for fuzzy finding.

### Windows

```powershell
choco install neovide nodejs ripgrep fd zig
```

```powershell
cmd /c mklink "%USERPROFILE%\.vsvimrc" "%USERPROFILE%\.vim\.vsvimrc"
cmd /c mklink /D "%USERPROFILE%\AppData\Local\nvim\" "%USERPROFILE%\.vim\"
```

### Debian

```sh
sudo apt install snapd nodejs npm ripgrep fd-find -y
sudo snapd install --classic nvim
```

```sh
mkdir -p ~/.config/nvim/
ln -s ~/.config/nvim/ ~/.vim
```

## Setup

```sh
git clone git@gitlab.com:DanielHack/vim.git ~/.vim
```

Start Neovim and it will automatically do the rest.
