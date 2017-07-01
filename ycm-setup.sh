#!/usr/bin/env bash

#TODO: Add selection for Arch Linux as well.

install() {
    sudo apt-get -y install build-essential cmake
    sudo apt-get -y install python-dev python3-dev
    cd ~/.vim/bundle/youcompleteme
}

if [[ $# -eq 0 ]]; then
    echo "Installing basic completion"
    install
    ./install.py
fi

while [[ $# -gt 1 ]]
do
    case "$1" in
        -h|--help)
            echo "Usage: ./ycm-setup.sh [language..]"
            echo "Languages: c-family"
            echo "           golang"
            echo "           javascript"
            echo "           c#"
            echo "           python"
            echo "           all"
            echo "Not specifying language will just do a basic install"
            break
            ;;
        c-family)
            echo "Installing semantic support for C-family languages"
            install
            ./install.py --clang-completer
            shift
            ;;
        golang)
            echo "installing semantic support for golang"
            ./install.py --gocode-completer
            shift
            ;;
        javascript)
            echo "installing semantic support for javascript"
            ./install.py --tern-completer
            shift
            ;;
        c\#)
            echo "installing semantic support for C#"
            ./install.py --omnisharp-completer
            shift
            ;;
        python)
            echo "Installing semantic support for python"
            install
            pip install jedi
            shift
            ;;
        all)
            echo "Installing semantic support for all languages"
            ./install.py --all
            ;;
        *)
            echo "Undefined language. Check -h|--help for options"
            break
            ;;
    esac
done
