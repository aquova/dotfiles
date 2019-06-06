#!/bin/bash

# Installs Visual Studio Code settings and extensions

# The 'code' command needs to be operational from the command line
if ! command -v code >/dev/null; then
    echo "The 'code' command is not set up properly. Please look up how to do that before proceeding.";
    exit 1;
fi

echo "Installing Rainbow Brackets"
code --install-extension 2gua.rainbow-brackets
echo "Installing C/C++ tools"
code --install-extension ms-vscode.cpptools
echo "Installing Python tools"
code --install-extension ms-python.python
echo "Installing Vim"
code --install-extension vscodevim.vim
echo "Installing Gitlens"
code --install-extension eamodio.gitlens
echo "Installing settings cycler"
code --install-extension hoovercj.vscode-settings-cycler

echo "Installing color theme"
code --install-extension zhuangtongfa.Material-theme
echo "Installing icon theme"
code --install-extension PKief.material-icon-theme

echo "You'll need to set up your own settings.json file, as I couldn't be bothered to do it by system yet"
