#!/bin/bash

# Installation script for new OS installs
# Installs my setup for OS X
# Austin Bricker, 2018

# Checks if git is installed
if ! [ -x "$(command -v git)" ]; then
    echo "git is not installed. Please install git before proceeding.";
    exit 1;
fi

echo "Mac OS X Installation";

# Install software using Homebrew
echo "Installing Homebrew";
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
brew tap homebrew/bundle;
# Requires Brewfile in same directory
brew bundle;

echo "Moving dotfiles into place";
cp .bashrc ~;
cp .bash_profile ~;
cp .aliases ~;
cp .tmux.conf ~;

source $HOME/.bash_profile;

# Install vim presets
if ! command -v vim >/dev/null; then
    sh ./vim_install.sh;
if

echo "Your installation is complete!";
