source $HOME/.aliases
source $HOME/.ssh_aliases
source $HOME/scripts/welcome.sh

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export EDITOR=vim

parse_git_branch() {
    git symbolic-ref --short HEAD 2> /dev/null
}

setopt PROMPT_SUBST
PROMPT="%F{blue}%n%F{magenta}@%F{blue}%M%F{green}[%*]%F{white}:%F{yellow}%~%F{blue}$(parse_git_branch)%F{white}%# "
