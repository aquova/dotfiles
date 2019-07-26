#!/bin/bash

# Unified installation script for new OS installs
# Austin Bricker, 2018-2019

# Determine OS, setup install commands
OS = ""
INSTALL_COMMAND = ""
UPDATE_UPGRADE_COMMAND = ""

case "$OSTYPE" in
    linux*)
        if [ -x "$(command -v apt)" ]; then
            echo "Debian/Ubuntu-based OS detected";
            OS = "Debian";
            INSTALL_COMMAND = "sudo apt install";
            UPDATE_UPGRADE_COMMAND = "sudo apt update & sudo apt upgrade";
        elif [ -x "$(command -v pacman)" ]; then
            echo "Arch-based OS detected";
            OS = "Arch";
            INSTALL_COMMAND = "sudo pacman -S";
            UPDATE_UPGRADE_COMMAND = "sudo pacman -Syu";
        else
            echo "Unknown Linux distro, exiting";
            exit 1;
        fi
        ;;
    darwin*)
        echo "MacOS detected.";
        OS = "Mac";
        COMMAND = "brew";
        if ! [-x "$(command -v brew)" ]; then
            echo "Homebrew not installed, installing now.";
            /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
        fi
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
echo "Installing programs";
$INSTALL_COMMAND neofetch tldr tmux vim;

# TODO: Install bat/other sharkdp programs
# Homebrew has bat, but others have to install from releases
if $OS == "Mac"; then
    brew install bat;
fi

echo "Moving dotfiles into place";
cp .bashrc $HOME;
cp .bash_profile $HOME;
cp .aliases $HOME;
cp .tmux.conf $HOME;
cp git-prompt.sh $HOME;

source $HOME/.bash_profile;

echo "Your installation is complete!";

