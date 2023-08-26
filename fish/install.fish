#!/bin/fish

set -l FISH_DIR "$HOME/.config/fish"
mkdir -p $FISH_DIR/{completions,conf.d,functions}
git submodule update --init

cp config.fish $FISH_DIR
cp fish_user_key_bindings.fish $FISH_DIR/functions

# Install plugins
# TODO: If I ever use another plugin, make this a general loop
cd fzf.fish
cp completions/* $FISH_DIR/completions
cp conf.d/* $FISH_DIR/conf.d
cp functions/* $FISH_DIR/functions

