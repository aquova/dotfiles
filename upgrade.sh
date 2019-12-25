#!/bin/sh

# Gets my most recent dotfiles and places them in the appropriate locations
git pull
git submodule update

# bash configurations
cp .bashrc ${HOME}
cp .bash_profile ${HOME}
cp .aliases ${HOME}

# Vim config
cp ./vimars/.vimrc ${HOME}

# Emacs config
cp .emacs ${HOME}

# Tmux config
cp .tmux.conf ${HOME}

echo "Files successfully copied"
