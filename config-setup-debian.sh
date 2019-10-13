#!/bin/bash
# Font Setup
echo "Installing fonts..."
cp -r ./.fonts $HOME
sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf
sudo ln -s /etc/fonts/conf.avail/70-yes-bitmaps.conf /etc/fonts/conf.d/70-yes-bitmaps.conf
sudo fc-cache -fv
echo

# Git Setup
echo "Setting up Git..."
git --version 2>&1 > /dev/null
GIT_IS_AVAILABLE=$?
if ! [[ $GIT_IS_AVAILABLE -eq 0 ]]; then
   sudo apt install git -y
else
    echo "Git is already installed"
fi
cp ./.gitconfig $HOME
echo

# Conky Setup
echo "Setting up conky..."
sudo apt update
sudo apt install conky-all -y
cp ./conky/conky_debian.conf $HOME/.conkyrc
killall -SIGUSR1 conky
echo "Please set conky as a start up process"
echo

# Colour Test
echo "Testing colours..."
if [ $(dpkg-query -W -f='${Status}' nano 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo "Python is not installed. xterm not set to 256 colors"
else
    python color.py
fi
echo

# Vim Setup
echo "Setting up Vim..."
sudo apt install vim -y
cp ./vim/.vimrc $HOME
echo "Please run GoInstallBinaries if doing go development"
echo "Please run ycm-setup.sh with the appropriate languages"
echo

# Theme Setup
echo "Setting up colour scheme..."
terminal=$(cat /etc/alternatives/x-terminal-emulator | grep ^exec);
echo $terminal
if [[ $terminal == *"gnome-terminal"* ]]; then
    rm -rf $HOME/.config/seoul256-gnome-terminal
    git clone https://github.com/anuragsoni/seoul256-gnome-terminal.git \
        $HOME/.config/seoul256-gnome-terminal
    source $HOME/.config/seoul256-gnome-terminal/seoul256-dark.sh
elif [[ $terminal == *"xfce4-terminal"* ]]; then
    git clone https://github.com/atweiden/xfce4-terminal-colors-seoul256
    cd xfce4-terminal-colors-seoul256
    sudo cp seoul256.theme /usr/share/xfce4/terminal/colorschemes
    cd -
    rm -rf xfce4-terminal-colors-seoul256
else
    echo "Terminal not supported for colour scheme"
fi
echo

# Neofetch Setup
echo "Setting up Neofetch..."
sudo add-apt-repository ppa:dawidd0811/neofetch-daily -y
sudo apt install neofetch w3m-img imagemagick -y
cp ./neofetch/config $HOME/.config/neofetch/
echo

# Bash Setup
cp ./.bashrc $HOME
source $HOME/.bashrc
echo
