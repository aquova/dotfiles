#!/bin/bash

# Installs Vim plugins and configurations
# Austin Bricker, 2018

# Checks if git is installed.
if ! command -v git >/dev/null; then
    echo "git is not installed. Please install git before proceeding.";
    exit 1;
fi

# Install Pathogen, place into autoload folder
echo "Installing Pathogen";
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors;
# Might need to specify that curl needs to be installed too
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim;

echo "Installing Vim plugins";
#VimCompletesMe
echo "Installing VimCompletesMe";
git clone git://github.com/ajh17/VimCompletesMe.git ~/.vim/bundle/VimCompletesMe;
# AutoPairs
echo "Installing auto-pairs";
git clone git://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs;
# Indent Line
echo "Installing indentLine";
git clone git://github.com/Yggdroot/indentLine ~/.vim/bundle/indentLine;
# Vim-Airline
echo "Installing vim-airline";
git clone git://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline;
# Vim-Commentary
echo "Installing vim-commentary";
git clone git://github.com/tpope/vim-commentary ~/.vim/bundle/vim-commentary;
# Vim-Repeat
echo "Installing vim-repeat";
git clone git://github.com/tpope/vim-repeat ~/.vim/bundle/vim-repeat;
# Vim-Surround
echo "Installing vim-surround";
git clone git://github.com/tpope/vim-surround ~/.vim/bundle/vim-surround;
# Vim-unimpaired
echo "Installing vim-unimpared";
git clone git://github.com/tpope/vim-unimpaired ~/.vim/bundle/vim-unimpaired;
# Vim-easymotion
echo "Installing vim-easymotion";
git clone https://github.com/easymotion/vim-easymotion ~/.vim/bundle/vim-easymotion;
# Vim-highlightedyank
echo "Installing vim-highlightedyank";
git clone https://github.com/machakann/vim-highlightedyank ~/.vim/bundle/vim-highlightedyank;
# Vim-sneak
echo "Installing vim-sneak";
git clone git://github.com/justinmk/vim-sneak.git ~/.vim/bundle/vim-sneak;

echo "Installing colorscheme";
git clone https://github.com/joshdick/onedark.vim;
mv onedark.vim/colors/onedark.vim ~/.vim/colors;
mv onedark.vim/autoload/* ~/.vim/autoload;
rm -rf onedark.vim;

echo "Moving vimrc into place";
cp .vimrc ~;

echo "Complete! Your Vim installation (should) be complete! Enjoy!";
