#!/bin/bash

# Installs Vim plugins and configurations
# Austin Bricker, 2018-2019

# Checks if git is installed.
if ! command -v git >/dev/null; then
    echo "git is not installed. Please install git before proceeding.";
    exit 1;
fi

#Install Pathogen, place into autoload folder
echo "Installing Pathogen";
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors;
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim;

BUNDLE_DIR="$HOME/.vim/bundle/"

PLUGINS=(
    ajh17/VimCompletesMe
    jiangmiao/auto-pairs
    Yggdroot/indentLine
    vim-airline/vim-airline
    tpope/vim-commentary
    tpope/vim-repeat
    tpope/vim-surround
    tpope/vim-unimpaired
    easymotion/vim-easymotion
    machakann/vim-highlightedyank
    justinmk/vim-sneak
    mhinz/vim-signify
)

echo "Installing Vim plugins";

for p in "${PLUGINS[@]}"; do
    REPO_NAME=$(echo "$p" | cut -d'/' -f2-);

    echo "Installing $REPO_NAME";
    git clone "https://github.com/$p" "$BUNDLE_DIR$REPO_NAME";
done

echo "Installing colorscheme";
git clone https://github.com/joshdick/onedark.vim;
mv onedark.vim/colors/onedark.vim ~/.vim/colors;
mv onedark.vim/autoload/* ~/.vim/autoload;
rm -rf onedark.vim;

echo "Moving vimrc into place";
cp ../.vimrc $HOME;

echo "Complete! Your Vim installation (should) be complete! Enjoy!";
