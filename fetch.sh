#!/bin/bash

# Copies config files from around my machine into the dotfiles repo

# This works because I always use same filepath. Should make more generic
DOTFILES="${HOME}/git/dotfiles/conf"

# bash configurations
cp "${HOME}/.bashrc" $DOTFILES
cp "${HOME}/.bash_profile" $DOTFILES
cp "${HOME}/.aliases" $DOTFILES

# Emacs config
cp "${HOME}/.emacs" $DOTFILES

# Terminal config
cp "${HOME}/.alacritty.yml" $DOTFILES

# Tmux config
cp "${HOME}/.tmux.conf" $DOTFILES

# VSCode config
if [[ "$OSTYPE" == "darwin"* ]]; then
    cp "${HOME}/Library/Application Support/Code/User/settings.json" $DOTFILES
elif [ -n "&(uname -a | grep Ubuntu)" ]; then
    echo "Need to set VSCode settings path on Ubuntu"
fi

