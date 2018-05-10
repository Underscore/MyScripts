#!/bin/bash

#Setup
PATH="$PATH:/usr/games"
apt-get update
#pip install --upgrade pip

#Set variables
pkgname=(terminator vim git ruby cowsay fortune-mod vlc nmap nyancat figlet toilet screen tmux gimp)
retries=1
max=5

#Create function to install and retry up to 5 times on failure
function installandretry() {
for i in ${pkgname[@]}; do 
  if [ "$retries" -le 5 ]; then 
    apt-get install $i -y && continue 
  else
    echo "$i failed to install $retries out of $max times on $(date)." >> errors.txt
  fi
  retries=1 
done
}

#Execute function to install pkgs with up to 5 retries. 
#Debugging enabled
set -xeuo
installandretry
set +x

##Install lolcat
###Python 2.7 version
###pip install lolcat -y
#
###Ruby Version
#wget https://github.com/busyloop/lolcat/archive/master.zip
#unzip master.zip
#cd lolcat-master/bin
#gem install lolcat
#cd ..
#cd ..
#rm -rf lolcat-master
#rm -rf master.zip
#
##Upgrade any out of data packages
#apt-get upgrade -y

#Completion message
if dkpg -s lolcat >/dev/null 2>&1 && dpkg -s cowsay >/dev/null 2>&1; then
  cowsay -f tux Packages have finished installing. | lolcat
else 
  echo "Packages have finished installing!"
fi


