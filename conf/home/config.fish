if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""

function fish_prompt
    set -l prompt_symbol '$ '
    fish_is_root_user; and set prompt_symbol '# '

    echo -s (set_color cyan; whoami) \
    (set_color magenta)@ \
    (set_color cyan; prompt_hostname) \
    (set_color green)\[(date +%T)\] \
    (set_color normal): \
    (set_color yellow; pwd) \
    (set_color red) (fish_git_prompt) \
    (set_color normal)$prompt_symbol
end

function la
    ls -a $argv
end

function lh
    ls -lh $argv
end

function gittree
    git log --graph --pretty=oneline --abbrev-commit
end

function gitsha
    git rev-parse HEAD
end

function tmuxa
    tmux a -t $argv
end

function cs
    cd $argv
    ls
end

function ..
    cd ..
end

function ...
    cd ../..
end
