# Bash Setup
cp ./.bashrc ~
source ~/.bashrc

# Conky Setup
sudo apt-get -y install conky
cp ./conky.conf ~
echo "Please set conky as a start up process"

# Colour Test
if [ $(dpkg-query -W -f='${Status}' nano 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo "Python is not installed. Cannot check if colours are correct"
else
    python color.py
fi

# Vim Setup
./vundle-setup.sh
cp ./.vimrc ~
echo "Please run GoInstallBinaries if doing go development"
echo "Please run ycm-setup.sh with the appropriate languages"
