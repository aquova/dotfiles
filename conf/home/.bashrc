# Keep aliases in their own file
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# Sensitive aliases will go into .ssh_aliases, hidden from version control
if [ -f ~/.ssh_aliases ]; then
    . ~/.ssh_aliases
fi

# Other items, such as computer specific PATH changes, will go into .localrc, which won't be in version control
if [ -f ~/.localrc ]; then
    . ~/.localrc
fi

if [ -f ~/scripts/welcome.sh ]; then
    . ~/scripts/welcome.sh
fi

if [ -f $HOME/git-prompt.sh ]; then
    source $HOME/git-prompt.sh
fi

export EDITOR=vim
export TERM=linux
export CLICOLOR=1

END="$";
case $HOSTNAME in
    "mercury")
        END="☿"
        ;;
    "venus")
        END="♀"
        ;;
    "earth")
        END="🜨"
        ;;
    "mars")
        END="♂"
        ;;
    "jupiter")
        END="♃"
        ;;
    "saturn")
        END="♄"
        ;;
    "uranus")
        END="⛢"
        ;;
    "neptune")
        END="♆"
        ;;
    "pluto")
        END="♇"
        ;;
    "luna")
        END="☾"
        ;;
    "ceres")
        END="⚳"
        ;;
esac

export PS1="\[\e[36m\]\u\[\e[35m\]@\[\e[36m\]\h\[\e[32m\][\t]\[\e[m\]:\[\e[33m\]\w\[\e[36m\]\$(__git_ps1)\[\e[m\]$END "
