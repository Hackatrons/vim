#!/bin/bash

# install node
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

# install node packages
npm install eslint eslint-plugin-react babel-eslint -g

# update any existing packages
npm install npm@latest -g
npm cache clean -f

# install vim
apt-get install vim -y

# symlink so vim can find our configuration files
ln -s ~/.vim/.vimrc ~/.vimrc
