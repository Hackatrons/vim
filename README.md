# Neovim

This repository contains my Neovim settings.

## Pre-requisites

- Node.js for language servers and code completion.
- ripgrep and fd for fuzzy finding.

## Setup

```sh
git clone https://github.com/hackatrons/vim ~/.vim
```

### Windows

Install pre-requisites:

```powershell
choco install neovide nodejs ripgrep fd
```

Link the config:

```powershell
cmd /c mklink "%USERPROFILE%\.vsvimrc" "%USERPROFILE%\.vim\.vsvimrc"
cmd /c mklink /D "%USERPROFILE%\AppData\Local\nvim\" "%USERPROFILE%\.vim\"
```

### Debian

Install pre-requisites:

```sh
sudo apt install nodejs npm ripgrep fd-find -y
```

Install neovim:

```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
```

Link the config:

```sh
mkdir -p ~/.config/nvim/
ln -s ~/.config/nvim/ ~/.vim
```

Then add this to your shell config (~/.bashrc, ~/.zshrc, ...):

```sh
export PATH="$PATH:/opt/nvim-linux64/bin"
```

## Run

Start Neovim and it will automatically do the rest.
