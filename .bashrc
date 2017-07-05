#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

#Golang
export GOPATH=$HOME/go
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
neofetch

# 256 colour terminal
if [ "$COLORTERM" == "xfce4-terminal" ] ; then
    export TERM=xterm-256color
fi

# Easy extraction
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}
