#!/bin/bash

apt-get update
pip install --upgrade pip

cd ~/Downloads

#Install Terminator
apt-get install terminator -y

#Install vim
apt-get install vim -y

#Install git
apt-get install git -y

#Install ruby
apt-get install ruby

#Install lolcat
PATH="$PATH:/usr/games"

##Python 2.7 version
##pip install lolcat -y

##Ruby Version
wget https://github.com/busyloop/lolcat/archive/master.zip
unzip master.zip
cd lolcat-master/bin
gem install lolcat
cd ..
cd ..
rm -rf lolcat-master
rm -rf master.zip

#Install cowsay
apt-get install cowsay -y

#Install fortune
apt-get install fortune-mod -y

#Install VLC
apt-get install vlc -y

#Install nmap
sudo apt-get install nmap -y

#Install nyancat
apt-get install nyancat -y

#Install figlet
apt-get install figlet -y

#Install toilet
apt-get install toilet -y

#Install tmux
apt-get install tmux -y

#Install screen
apt-get install screen -y

#Upgrade any out of data packages
#apt-get upgrade -y

#Completion message
cowsay -f tux INSTALL COMPETED | lolcat

#if dpkg -s lolcat >/dev/null 2>&1 && dpkg -s figlet >/dev/null 2>&1 && dpkg -s toilet >/dev/null 2>&1; then
# rand_font=$(find /usr/share/figlet/*tlf | sort --random-sort | head -1 | sed s/\.[^\.]*$//)
# figlet -c -t -k -f "$rand_font" "Applications have finished installing" | /usr/games/lolcat -p 1
#  date '+%c' | toilet -f term -F border --metal
#else
# echo "Applications have finished installing..."
#fi
