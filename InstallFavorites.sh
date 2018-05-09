#!/bin/bash

PATH="$PATH:/usr/games"
#apt-get update
#pip install --upgrade pip

aptname=(terminator vim git ruby cowsay fortune-mod vlc nmap nyancat figlet toilet screen tmux)
retries=5

function retry5() {
for i in ${aptname[@]}; do
  if [ "$retries" -ge 0 ]; then
    apt-get install $i -y && continue 
  else
   retries=`expr $retries - 1` 
   touch errors.txt 
   echo "$i failed to install on $(date)" >> errors.txt 
  fi
  retires=5
done
}
set -xeuo
retry5
set +x
##Install Terminator
#apt-get install terminator -y
#
##Install vim
#apt-get install vim -y
#
##Install git
#apt-get install git -y
#
##Install ruby
#apt-get install ruby
#
##Install cowsay
#apt-get install cowsay -y
#
##Install fortune
#apt-get install fortune-mod -y
#
##Install VLC
#apt-get install vlc -y
#
##Install nmap
#sudo apt-get install nmap -y
#
##Install nyancat
#apt-get install nyancat -y
#
##Install figlet
#apt-get install figlet -y
#
##Install toilet
#apt-get install toilet -y
#
##Install tmux
#apt-get install tmux -y
#
##Install screen
#apt-get install screen -y
#
##Install lolcat
#
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
