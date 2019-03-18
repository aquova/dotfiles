#!/bin/sh

# Copies config files from around my machine into the dotfiles repo

DOTFILES="${HOME}/git/dotfiles"

# bash configurations
cp "${HOME}/.bashrc" $DOTFILES
cp "${HOME}/.bash_profile" $DOTFILES
cp "${HOME}/.aliases" $DOTFILES

# Vim config
cp "${HOME}/.vimrc" $DOTFILES

# Emacs config
cp "${HOME}/.emacs" $DOTFILES

# Terminal config
cp "${HOME}/.config/kitty/kitty.conf" $DOTFILES

# Tmux config
cp "${HOME}/.tmux.conf" $DOTFILES

# VSCode config
cp "${HOME}/Library/Application Support/Code/User/settings.json" $DOTFILES
