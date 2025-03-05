#!/usr/bin/env fish

set -l FISH_DIR "$HOME/.config/fish"
mkdir -p $FISH_DIR/{completions,conf.d,functions}
git submodule update --init

ln -s (realpath config.fish) $FISH_DIR/config.fish

# Install plugins
for plugin in (ls -d */)
    pushd $plugin
    if test -e "completions"
        cp completions/* $FISH_DIR/completions
    end
    if test -e "conf.d"
        cp conf.d/* $FISH_DIR/conf.d
    end
    if test -e "functions"
        cp functions/* $FISH_DIR/functions
    end
    popd
end
