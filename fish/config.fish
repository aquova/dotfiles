set -gx EDITOR nvim
set -gx TERM xterm-256color
set fish_key_bindings fish_user_key_bindings

set fish_greeting ""

function fish_prompt
    echo -s (set_color cyan; whoami) \
    (set_color magenta)@ \
    (set_color cyan; prompt_hostname) \
    (set_color green)\[(date +%T)\] \
    (set_color normal): \
    (set_color yellow; pwd) \
    (set_color red) (fish_git_prompt) \
    (set_color normal)'$ '
end

function la
    ls -a $argv
end

function lh
    ls -lh $argv
end

# From here: https://github.com/fish-shell/fish-shell/releases/tag/3.6.0
function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr --add dotdot --regex '^\.\.+$' --function multicd

function last_history_item; echo $history[1]; end
abbr -a !! --position anywhere --function last_history_item

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
