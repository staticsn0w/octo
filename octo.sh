#!/bin/bash

cd /usr/ports
ls
echo "this is everything in your /usr/ports directory, what would you like to install?"
read input
if [ -d "$input" ]; then
  cd $input
else
  echo "ERROR! PACKAGE DOES NOT EXIST!"
  echo "would you like to fetch the package from a URL?"
  echo "[y/n]"
  read yn
  if [ $yn = "y" ]; then
    echo "where is the package located? (must be tar.gz format!!)"
    read pkglocation
    sudo mkdir $input && sudo wget -O temp.tar.gz $pkglocation && sudo tar xf temp.tar.gz -C $input && sudo rm temp.tar.gz && cd $input
  elif [ $yn = "n" ]; then
    echo "'N' ARGUMENT GIVEN, EXITING."
  else
    echo "ERROR! TYPE 'Y' OR 'N' ONLY!" 
  fi
fi
echo "does this package require the 'make install' command?"
echo "[y/n]"
read yn
if [ $yn = "y" ]; then
  sudo make && make install
elif [  $yn = "n" ]; then
  sudo make
else
  echo "ERROR! TYPE 'Y' OR 'N' ONLY!"
fi
