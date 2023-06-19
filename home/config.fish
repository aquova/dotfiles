if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx EDITOR nvim
set -gx TERM xterm-256color
set fish_vi_key_bindings

set fish_greeting ""

function fish_prompt
    set -l prompt_symbol '$ '
    switch (hostname)
        case "mercury"
            set prompt_symbol "☿ "
        case "venus"
            set prompt_symbol "♀ "
        case "earth"
            set prompt_symbol "🜨 "
        case "mars"
            set prompt_symbol "♂ "
        case "jupiter"
            set prompt_symbol "♃ "
        case "saturn"
            set prompt_symbol "♄ "
        case "uranus"
            set prompt_symbol "⛢ "
        case "neptune"
            set prompt_symbol "♆ "
        case "pluto"
            set prompt_symbol "♇ "
    end

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
