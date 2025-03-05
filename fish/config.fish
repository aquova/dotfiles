set -gx EDITOR nvim
set -gx TERM xterm-256color

set -g fish_key_bindings fish_vi_key_bindings
bind -M insert -m default jk backward-char force-repaint
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

abbr -a ga git add
abbr -a gco git commit
abbr -a gcl git checkout -- .
abbr -a gd git diff
abbr -a gl git log
abbr -a gp git pull
abbr -a gsh git show --ext-diff
abbr -a gst git status
abbr -a gitsha git rev-parse HEAD
abbr -a gittree git log --graph --pretty=oneline --abbrev-commit

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
