#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

export GOPATH=~/go-workspace
export PATH=$PATH:$GOPATH/bin
export EDITOR='vim'

# Bash History
export HISTCONTROL=ignoredups
export HISTSIZE=1000
export HISTFILESIZE=3000

# Weather
checkWeather() {
    curl wttr.in/$1
}

# Aliases
alias ls='ls --color=auto'
alias la='ls -A --color=auto'
alias grep='grep --color=auto'
alias weather=checkWeather
alias moon='curl wttr.in/moon'

set -o vi
screenfetch

if [ "$COLORTERM" == "xfce4-terminal" ] ; then
    export TERM=xterm-256color
fi
