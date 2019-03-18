#!/bin/bash

# Installation script for new OS installs
# Installs my setup for Debian-based OSes
# Austin Bricker, 2018-2019

# Checks if git is installed
if ! [ -x "$(command -v git)" ]; then
    echo "git is not installed. Please install git before proceeding.";
    exit 1;
fi

echo "Debian-based installation";
echo "Updating apt packages";
sudo apt update && sudo apt upgrade;
echo "Installing new packages";
sudo apt-get install neofetch tmux vim;

echo "Moving dotfiles into place";
cp .bashrc $HOME;
cp .bash_profile $HOME;
cp .aliases $HOME;
cp .tmux.conf $HOME;
cp git-prompt.sh $HOME;

source $HOME/.bash_profile;

echo "Your installation is complete!";
