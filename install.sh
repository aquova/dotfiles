#!/bin/bash

# Installation script for new OS installs
# Installs my setup for OS X, Debian-based, and Arch-based OSes
# Austin Bricker, 2018

# Checks if git is installed
if ! [ -x "$(command -v git)" ]; then
    echo "git is not installed. Please install git before proceeding.";
    exit 1;
fi

# Mac OS X Installation
case `uname` in
    # Linux installation
    Linux )
        # Arch-based Installation
        if ! [ -x "$(command -v pacman)" ]; then
            echo "OS Identified - Arch-based Linux";
            echo "Updating pacman packages";
            sudo pacman -Syu;
            echo "Installing new packages";
            sudo pacman -S cmus ffmpeg irssi lua neofetch pandoc ranger sqlite tmux vim wine youtube-dl yaourt gimp handbrake thunderbird vlc;
        # Debian-based Installation
        elif ! [ -x "$(command -v apt)" ]; then
            echo "OS Identified - Debian-based Linux";
            echo "Updating apt packages";
            sudo apt update && sudo apt upgrade;
            echo "Installing new packages";
            sudo apt-get install cmus ffmpeg irssi lua neofetch pandoc ranger sqlite tmux vim wine youtube-dl gimp handbrake thunderbird vlc;
        # Other Installation
        else
            echo "Unknown OS. I don't know what to do";
            exit 1;
        fi
    ;;
    # OSX Installation
    Darwin )
        echo "OS Identified - Mac OS X";

        # Install software using Homebrew
        echo "Installing Homebrew";
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
        brew tap homebrew/bundle;
        # Requires Brewfile in same directory
        brew bundle;
    ;;
    * )
        echo "Unknown OS. I don't know what to do";
        exit 1;
    ;;
esac

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
