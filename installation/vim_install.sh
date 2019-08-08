#!/bin/bash

# Installs Vim plugins and configurations
# Austin Bricker, 2018-2019

# Checks if git and curl are installed.
if [! command -v git >/dev/null] || [! command -v curl >/dev/null]; then
    echo "git and curl must be installed. Please install them before proceeding.";
    exit 1;
fi

#Install Pathogen, place into autoload folder
echo "Installing Pathogen";
mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle $HOME/vim/colors;
curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim;

BUNDLE_DIR="$HOME/.vim/bundle/"

PLUGINS=(
    ajh17/VimCompletesMe
    easymotion/vim-easymotion
    jiangmiao/auto-pairs
    justinmk/vim-sneak
    machakann/vim-highlightedyank
    mhinz/vim-signify
    tpope/vim-commentary
    tpope/vim-fugitive
    tpope/vim-repeat
    tpope/vim-surround
    tpope/vim-unimpaired
    vim-airline/vim-airline
    Yggdroot/indentLine
)

echo "Installing Vim plugins";

for p in "${PLUGINS[@]}"; do
    REPO_NAME=$(echo "$p" | cut -d'/' -f2-);

    echo "Installing $REPO_NAME";
    git clone --quiet "https://github.com/$p" "$BUNDLE_DIR$REPO_NAME" > /dev/null;
done

echo "Installing colorscheme";
git clone --quiet https://github.com/joshdick/onedark.vim > /dev/null;
mv onedark.vim/colors/onedark.vim ~/.vim/colors;
mv onedark.vim/autoload/* ~/.vim/autoload;
rm -rf onedark.vim;

echo "Moving vimrc into place";
cp ../.vimrc $HOME;

echo "Complete! Your Vim installation (should) be complete! Enjoy!";
