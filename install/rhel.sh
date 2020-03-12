#!/bin/bash

# install node
curl -sL https://rpm.nodesource.com/setup_12.x | bash -

# install node packages
npm install eslint eslint-plugin-react babel-eslint -g

# install vim
yum install vim -y

# symlink so vim can find our configuration files
ln -s ~/.vim/.vimrc ~/.vimrc
