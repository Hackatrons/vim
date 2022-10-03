# Neovim

This repository contains my Neovim settings.

## Setup

```sh
git clone git@gitlab.com:DanielHack/vim.git ~/.vim
```

## Pre-requisites

- Node.js for language servers and code completion.

### Windows

```powershell
choco install neovide nodejs
```

```powershell
cmd /c mklink "%USERPROFILE%\.vsvimrc" "%USERPROFILE%\.vim\.vsvimrc"
cmd /c mklink /D "%USERPROFILE%\AppData\Local\nvim\" "%USERPROFILE%\.vim\"
```

### Debian

```sh
sudo apt install neovim nodejs -y
```

```sh
mkdir -p ~/.config/nvim/
ln -s ~/.vim/ ~/.config/nvim/
```
