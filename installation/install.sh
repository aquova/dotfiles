#!/bin/bash

# Unified installation script for new OS installs
# Austin Bricker, 2018-2020

# Determine OS, setup install commands
OS=""
INSTALL_COMMAND=""
UPDATE_UPGRADE_COMMAND=""

case "$OSTYPE" in
    linux*)
        if [ -x "$(command -v apt)" ]; then
            echo "Debian/Ubuntu-based OS detected";
            OS="Debian";
            INSTALL_COMMAND="sudo apt install";
            UPDATE_UPGRADE_COMMAND="sudo apt update & sudo apt upgrade";
        elif [ -x "$(command -v pacman)" ]; then
            echo "Arch-based OS detected";
            OS="Arch";
            INSTALL_COMMAND="sudo pacman -S";
            UPDATE_UPGRADE_COMMAND="sudo pacman -Syu";
        else
            echo "Unknown Linux distro, exiting";
            exit 1;
        fi
        ;;
    darwin*)
        echo "MacOS detected.";
        OS="Mac";
        INSTALL_COMMAND="brew";
        if ! [-x "$(command -v brew)" ]; then
            echo "Homebrew not installed, installing now.";
            /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
        fi
        UPDATE_UPGRADE_COMMAND="brew update & brew upgrade"
        ;;
    *)
        echo "Unknown OS. Exiting."
        exit 1;
        ;;
esac

# Update and upgrade package manager
echo "Updating and upgrading currently installed packages.";
$UPDATE_UPGRADE_COMMAND;

# Checks if git is installed
if ! [ -x "$(command -v git)" ]; then
    echo "git is not installed. Installing git now.";
    $INSTALL_COMMAND git;
fi

# Installs commonly used programs
# TODO: May want to add other programs here
echo "Installing programs";
$INSTALL_COMMAND alacritty neofetch tldr tmux vim;

echo "Moving dotfiles into place";
# These assume that you are running this in the installation directory
# TODO: Make this more generic
cp ../conf/.alacritty.yml $HOME;
cp ../conf/.bashrc $HOME;
cp ../conf/.bash_profile $HOME;
cp ../conf/.aliases $HOME;
cp ../conf/.tmux.conf $HOME;

mkdir -p "${HOME}/scripts";
cp ../scripts/welcome.sh "${HOME}/scripts";
cp git-prompt.sh $HOME;

source $HOME/.bash_profile;

echo "Your installation is complete!";

