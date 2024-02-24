set -gx EDITOR nvim
set -gx TERM xterm-256color
set fish_key_bindings fish_user_key_bindings

set fish_greeting ""

if status is-interactive
    atuin init fish | source
end

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

if type -q eza
    alias ls="eza"
    alias la="eza -a"
    alias lh="eza -l --icons"
else
    alias la="ls -a"
    alias lh="ls -lh"
end

alias tmuxa="tmux a -t"

function cs
    cd $argv
    ls
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

