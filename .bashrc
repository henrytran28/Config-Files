#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

export GOPATH=~/go-workspace
export PATH=$PATH:$GOPATH/bin

# Weather
checkWeather() {
    curl wttr.in/$1
}

alias ls='ls --color=auto'
alias weather=checkWeather
alias moon='curl wttr.in/moon'

set -o vi
screenfetch
