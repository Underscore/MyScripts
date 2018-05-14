#!/bin/bash

#Setup
PATH="$PATH:/usr/games"
apt-get update
pip install --upgrade pip

#Set variables
pkgname=(terminator vim git ruby cowsay fortune-mod vlc nmap nyancat figlet toilet screen tmux gimp)
retries=1
max=5
delay=5
touch isntallerrors.txt

#Create function to install and retry up to 5 times on failure
function installandretry() {
for i in ${pkgname[@]}; do 
  while true; do
    apt-get install $i -y && break || { 
      if [ "$retries" -le $max ]; then 
        echo "$i failed to install $retries out of $max times on $(date)." >> errors.txt 
        ((retries++)) 
        sleep $delay;
      else
        break
      fi
    }
  done
  retries=1
done
}

#Execute function to install pkgs with up to 5 retries. 
installandretry

#Install lolcat
##Python 2.7 version
#pip install lolcat -y

##Ruby Version
wget https://github.com/busyloop/lolcat/archive/master.zip
unzip master.zip
cd lolcat-master/bin
gem install lolcat
cd ..
cd ..
rm -rf lolcat-master
rm -rf master.zip

#Upgrade any out of data packages
apt-get upgrade -y

#Completion message
if dpkg -s lolcat >/dev/null 2>&1 && dpkg -s cowsay >/dev/null 2>&1; then
  cowsay -f tux Packages have finished installing. | lolcat
else 
  echo "Packages have finished installing!"
fi
