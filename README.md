# Neovim #

This repository contains my Neovim settings.

## Installation ##

```sh
git clone git@gitlab.com:DanielHack/vim.git ~/.vim
```

### Windows ###

```cmd
cmd /c mklink "%USERPROFILE%\.vsvimrc" "%USERPROFILE%\.vim\.vsvimrc"
cmd /c mklink /D "%USERPROFILE%\AppData\Local\nvim\" "%USERPROFILE%\.vim\"
```

### Linux (Debian based) ###

```sh
mkdir -p ~/.config/nvim/
ln -s ~/.vim/ ~/.config/nvim/
```
