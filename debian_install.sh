#!/bin/bash

# Installation script for new OS installs
# Installs my setup for Debian-based OSes
# Austin Bricker, 2018

# Checks if git is installed
if ! [ -x "$(command -v git)" ]; then
    echo "git is not installed. Please install git before proceeding.";
    exit 1;
fi

echo "Debian-based installation";
echo "Updating apt packages";
sudo apt update && sudo apt upgrade;
echo "Installing new packages";
sudo apt-get install neofetch lolcat tmux vim;

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
