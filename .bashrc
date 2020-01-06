if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

if [ -f ~/.ssh_aliases ]; then
    . ~/.ssh_aliases
fi

if [ -f ~/z.lua ]; then
    eval "$(lua ~/z.lua --init bash)"
fi

export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin/pyls:$PATH
export TERM=xterm-kitty
export EDITOR=vim

source $HOME/git-prompt.sh
export PS1="\[\e[36m\]\u\[\e[35m\]@\[\e[36m\]\h\[\e[32m\][\T]\[\e[m\]:\[\e[33m\]\w\[\e[36m\]\$(__git_ps1)\[\e[m\]$ "
export CLICOLOR=1
