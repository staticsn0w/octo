#!/bin/sh

cd /usr/ports
ls
printf "Listed /usr/ports directory, what to install?"
read input
if [ -d "$input" ]; then
  cd $input
else
  printf "Package does not exist! Would you like to fetch the package from a URL? [y/n]"
  read yn
  if [ $yn = "y" ]; then
    printf "Input URL.. (must be tar.gz)"
    read pkglocation
    sudo mkdir $input && sudo wget -O octo.tar.gz $pkglocation && sudo tar xf temp.tar.gz -C $input && sudo rm temp.tar.gz && cd $input
  elif [ $yn = "n" ]; then
    printf "'n' argument given, exiting.."
  else
    printf "Please type 'y' or 'n':" 
  fi
fi
printf "Does this package require the 'make install' command? [y/n]"
read yn
if [ $yn = "y" ]; then
  sudo make && make install
elif [  $yn = "n" ]; then
  sudo make
else
  printf "Please type 'y' or 'n':" 
fi
