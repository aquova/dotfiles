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
cp .alacritty.yml ${HOME} # Kitty config

# Copy VSCode settings, based on OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    cp settings.json ${HOME}/Library/Application\ Support/Code/User/
elif [ -n "&(uname -a | grep Ubuntu)" ]; then
    echo "Need to set VSCode settings path on Ubuntu"
fi

popd
echo "Files successfully copied"
