#!/bin/bash

# Gets my most recent dotfiles and places them in the appropriate locations
git pull
git submodule update

# Vim config
cp vimars/.vimrc ${HOME}

pushd conf
# bash configurations
cp .aliases ${HOME}
cp .bashrc ${HOME}
cp .bash_profile ${HOME}

cp .emacs ${HOME} # Emacs config
cp .tmux.conf ${HOME} # Tmux config
cp kitty.conf ${HOME} # Kitty config

popd
echo "Files successfully copied"
