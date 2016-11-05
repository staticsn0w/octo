#!/bin/bash

cd /usr/ports
ls
echo "this is everything in your /usr/ports directory, what would you like to install?"
read input
cd $input
echo "does this package require the 'make install' command?"
echo "[y/n]"
read yn
if [ $yn = "y" ]; then
        sudo make
        sudo make install
elif [  $yn = "n" ]; then
        sudo make
else
    	echo "ERROR! TYPE 'Y' OR 'N'!"
fi
