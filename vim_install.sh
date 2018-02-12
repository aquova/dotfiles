#!/bin/bash

# Installs Vim plugins and configurations
# Austin Bricker, 2018

# Checks if git is installed.
if command -v git >/dev/null; then
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
git clone git://github.com/ajh17/VimCompletesMe.git ~/.vim/bundle/VimCompletesMe;
echo "11% completed";
# AutoPairs
git clone git://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs;
echo "22% completed";
# Indent Line
git clone git://github.com/Yggdroot/indentLine ~/.vim/bundle/indentLine;
echo "33% completed";
# Vim-Airline
git clone git://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline;
echo "44% completed";
# Vim-Airline-Themes (Probably could just install desired theme)
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes;
echo "55% completed";
# Vim-Commentary
git clone git://github.com/tpope/vim-commentary ~/.vim/bundle/vim-commentary;
echo "66% completed";
# Vim-Repeat
git clone git://github.com/tpope/vim-repeat ~/.vim/bundle/vim-repeat;
echo "77% completed";
# Vim-Surround
git clone git://github.com/tpope/vim-surround ~/.vim/bundle/vim-surround;
echo "88% completed";
# Vim-unimpaired
git clone git://github.com/tpope/vim-unimpaired ~/.vim/bundle/vim-unimpaired;
echo "100% completed";

echo "Installing colorscheme";
git clone https://github.com/altercation/vim-colors-solarized;
mv vim-colors-solarized/colors/solarized.vim ~/.vim/colors;
rm -rf vim-colors-solarized;

echo "Moving vimrc into place"
cp .vimrc ~;

echo "Complete! Your Vim installation (should) be complete! Enjoy!"
