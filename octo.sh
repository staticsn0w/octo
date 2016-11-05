#!/bin/sh

cd /usr/ports
ls
printf "This is /usr/ports, what would you like to install?"
read input
cd $input
printf "Does this package require 'make install?'\n[y/n]"
read yn
if [ $yn = "y" ]; then
    sudo make && make install
elif [  $yn = "n" ]; then
    sudo make
else
    printf "Please type 'y' or 'n':"
fi
