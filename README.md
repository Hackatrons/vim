# VIM
This repository contains my VIM settings.
### Linux Installation
Bash:
```sh
git clone git@gitlab.com:DanielHack/vim.git ~/.vim
cd ~/.vim
git submodule init
git submodule update
ln -s ~/.vim/.vimrc ~/.vimrc
```

### Windows Installation
PowerShell:
```sh
git clone git@gitlab.com:DanielHack/vim.git $env:HOME\.vim
cd $env:HOME\.vim
git submodule init
git submodule update
cmd /c mklink %HOME%\.vimrc %HOME%\.vim\.vimrc
cmd /c mklink /D %HOME%\vimfiles %HOME%\.vim
```

Configure Git to use full VIM as the text editor instead of it's own:
```sh
git config --global core.editor "'C:\Program Files (x86)\Vim\vim80\vim.exe' -f -i NONE"
```