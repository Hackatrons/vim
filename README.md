# Neovim #

This repository contains my Neovim settings.

## Installation ##

```sh
git clone git@gitlab.com:DanielHack/vim.git ~/.vim
```

### Windows ###

**Install**

```powershell
choco install neovide
```

**Configure**

```powershell
cmd /c mklink "%USERPROFILE%\.vsvimrc" "%USERPROFILE%\.vim\.vsvimrc"
cmd /c mklink /D "%USERPROFILE%\AppData\Local\nvim\" "%USERPROFILE%\.vim\"
```

### Debian ###

**Install**

```sh
sudo apt install neovim -y
```

**Configure**

```sh
mkdir -p ~/.config/nvim/
ln -s ~/.vim/ ~/.config/nvim/
```
