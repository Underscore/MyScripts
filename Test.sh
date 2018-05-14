#!/bin/bash

#Set variables
pkgname=(git gimp screen)
retries=1
max=2
delay=5

#Create function to install and retry up to 5 times on failure
function installandretry() {
for i in ${pkgname[@]}; do
  while true; do
    {
      if [ "$retries" -le $max ]; then
        echo "$i $retries out of $max times." 
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

installandretry
