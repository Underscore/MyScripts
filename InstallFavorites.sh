#!/bin/bash

#Setup
PATH="$PATH:/usr/games"
apt-get update
pip install --upgrade pip

#Set variables
pkgname=(terminator vim git ruby cowsay fortune-mod vlc nmap nyancat figlet toilet screen tmux)
retries=5

#Create function to install and retry up to 5 times on failure
function installandretry() {
for i in ${pkgname[@]}; do #Loop through all pkgs in the array
  if [ "$retries" -ge 0 ]; then #If there are retries left continue
    apt-get install $i -y && continue #install from list auto yes and continue
  else
   retries=`expr $retries - 1` #if install failed dec counter
   touch errors.txt #create error log
   echo "$i failed to install on $(date)" >> errors.txt #add to error log with name and date 
  fi # exit if
  retries=5 #reinitialize retry variable
done #exit for loop
}

#Execute function to install pkgs with up to 5 retries. 
#Debugging enabled
set -xeuo
installandretry
set +x

#Install lolcat
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

#Upgrade any out of data packages
apt-get upgrade -y

#Completion message
if dkpg -s lolcat > /dev/null 2>&1; && dpkg -s cowsay >/dev/null 2>&1; then
  cowsay -f tux Packages have finished installing. | lolcat
else 
  echo "Packages have finished installing!"
fi

