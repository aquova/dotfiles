alias starwars='telnet towel.blinkenlights.nl'
alias la='ls -a'
alias lh='ls -lh'
alias raspi='ssh pi@abricker-pi.local'
alias radio='ssh pi@abricker-radio.local'
alias eos='ssh aquova@aquova.ddns.net -p 50912'
alias wine32="WINEPREFIX='/Users/austinbricker/.wine32' wine"
alias winsteam="wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Steam/Steam.exe"
alias vimcolor='~/go/bin/vixl44'
alias ..='cd ..'
alias gittree='git log --graph --pretty=oneline --abbrev-commit'
alias love="/Applications/love.app/Contents/MacOS/love"
alias 361ssh="ssh abricker@shell.cec.wustl.edu"

mvim () { /Applications/MacVim.app/Contents/bin/mvim "$1"; }
scpi () { scp "$1" pi@abricker-pi.local:~; }
gbdk-build () { /opt/gbdk/bin/lcc -o "$2" "$1"; }
cs () { cd "$1"; ls; }
tmuxa () { tmux a -t "$1"; }
gitup () { git add -A; git commit -m "$1"; git push; }

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

export PS1="\[\e[35m\]\u\[\e[m\]\[\e[32m\][\[\e[m\]\[\e[32m\]\T\[\e[m\]\[\e[32m\]]\[\e[m\]:\[\e[33m\]\w\[\e[m\]\\$ "
export CLICOLOR=1
