# VIM
This repository contains my VIM settings.

## Pre-requisites
NodeJS for w0rp/ale and coc.

**Windows**
```powershell
cinst nodejs.install
```

**RHEL**
```bash
curl -sL https://rpm.nodesource.com/setup_12.x | bash -
```

**Ubuntu**
```bash
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
```

If NodeJS is already installed, then ensure it's up to date.
```sh
npm install npm@latest -g
npm cache clean -f
```

## Installation
**Linux (bash)**
```sh
git clone git@gitlab.com:DanielHack/vim.git ~/.vim
cd ~/.vim
git submodule update --init --recursive
ln -s ~/.vim/.vimrc ~/.vimrc
```

**Windows (PowerShell)**
```powershell
git clone git@gitlab.com:DanielHack/vim.git ~\.vim
cd ~\.vim
git submodule update --init --recursive
cmd /c mklink "%USERPROFILE%\.vimrc" "%USERPROFILE%\.vim\.vimrc"
cmd /c mklink /D "%USERPROFILE%\vimfiles" "%USERPROFILE%\.vim"
```

### Git Configuration (optional)
Configure Git to use full VIM as the text editor instead of it's own:
```sh
git config --global core.editor "vim -u NONE"
```

### VsVim Configuration
```cmd
cmd /c mklink %USERPROFILE%\.vsvimrc %USERPROFILE%\.vim\.vsvimrc
```
In Visual Studio:
1. Tools -> Options -> VsVim
2. Change "VimRc File Loading" to vsvimrc files only

# Plugin Installation
## w0rp/ale
```sh
npm install eslint eslint-plugin-react babel-eslint -g
```

## markdown-preview-nvim
1. Run this inside of Vim
```
:call mkdp#util#install()
```

## coc.vim

**Windows (PowerShell)**
```powershell
mkdir -p ~/.vim/pack/plugins/start/coc
cd ~/.vim/pack/plugins/start/coc

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
wget https://github.com/neoclide/coc.nvim/archive/release.zip -OutFile release.zip
Expand-Archive .\release.zip -DestinationPath coc
mv .\coc\coc.nvim-release\* .
rmdir coc -Recurse
```

**Linux (bash)**
```bash
mkdir -p ~/.vim/pack/plugins/start/coc
cd ~/.vim/pack/plugins/start/coc
curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -h
mv .\coc.nvim-release\* .\coc
rm -rf .\coc
```
