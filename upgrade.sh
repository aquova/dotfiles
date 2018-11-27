#!/bin/sh

# Gets my most recent dotfiles and places them in the appropriate locations

git pull

# bash configurations
cp .bashrc ${HOME}
cp .bash_profile ${HOME}
cp .aliases ${HOME}

# Vim config
cp .vimrc ${HOME}

# Tmux config
cp .tmux.conf ${HOME}

echo "Files successfully copied"
