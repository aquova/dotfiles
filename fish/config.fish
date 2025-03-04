set -gx EDITOR nvim
set -gx TERM xterm-256color
set fish_key_bindings fish_user_key_bindings

set fish_cursor_default underscore
set fish_cursor_insert underscore
set fish_cursor_replace block
set fish_cursor_visual block

set fish_greeting ""

if status is-interactive; and type -q atuin
    atuin init fish --disable-up-arrow | source
end

function fish_prompt
    echo -s (set_color cyan; whoami) \
    (set_color magenta)@ \
    (set_color cyan; hostname) \
    (set_color green)\[(date +%T)\] \
    (set_color normal): \
    (set_color yellow; pwd) \
    (set_color red) (fish_git_prompt) \
    (set_color normal)'$ '
end

if command -v lsd > /dev/null
    alias ls="lsd"
end
alias la="ls -a"
alias lh="ls -lh"
alias tmuxa="tmux a -t"
alias gd="git diff"
alias gsh="git show --ext-diff"
alias gst="git status"
alias gl="git log"
alias gcl="git checkout -- ."
alias gitsha="git rev-parse HEAD"
alias gittree="git log --graph --pretty=oneline --abbrev-commit"

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
