# VIM
This repository contains my VIM settings.

### VIM Installation
* Make sure the VIM build has LUA enabled for Neocomplete.
    * Windows build: https://tuxproject.de/projects/vim
    * Linux build: TODO
* Download and place the LUA binaries into the VIM installation folder: http://luabinaries.sourceforge.net/download.html

### Linux Installation
Bash:
```sh
git clone git@gitlab.com:DanielHack/vim.git ~/.vim
cd ~/.vim
git submodule init
git submodule update
ln -s ~/.vim/.vimrc ~/.vimrc
vim +PluginInstall +qall
```

#### Git Configuration
Configure Git to use full VIM as the text editor instead of it's own:
```sh
git config --global core.editor "vim -f -i NONE"
```

### Windows Installation
PowerShell:
```powershell
git clone git@gitlab.com:DanielHack/vim.git $env:HOME\.vim
cd $env:HOME\.vim
git submodule init
git submodule update
cmd /c mklink %HOME%\.vimrc %HOME%\.vim\.vimrc
cmd /c mklink /D %HOME%\vimfiles %HOME%\.vim
vim +PluginInstall +qall
```

TODO: fix issue where $env:HOME is null on some machines. Can't use "~/" because it may not be set and $HOME goes to the H: drive for my work PC :|

#### Git Configuration
Configure Git to use full VIM as the text editor instead of it's own:
```sh
git config --global core.editor "'vim.exe' -f -i NONE"
```

#### VsVim Configuration
```cmd
cmd /c mklink %HOME%\.vsvimrc %HOME%\.vim\.vsvimrc
```
In Visual Studio:
1. Tools -> Options -> VsVim
2. Change "VimRc File Loading" to vsvimrc files only
