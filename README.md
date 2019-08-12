# VIM
This repository contains my VIM settings.

## Node Installation
To use the `w0rp/ale` plugin which uses `eslint` install Node v8.1.3 or above and then:
```sh
npm install eslint eslint-plugin-react babel-eslint -g
```

### Linux Installation
Bash:
```sh
git clone git@gitlab.com:DanielHack/vim.git ~/.vim
cd ~/.vim
git submodule init
git submodule update
ln -s ~/.vim/.vimrc ~/.vimrc
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
cmd /c mklink "%USERPROFILE%\.vimrc" "%USERPROFILE%\.vim\.vimrc"
cmd /c mklink /D "%USERPROFILE%\vimfiles" "%USERPROFILE%\.vim"
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
