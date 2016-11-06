#!/bin/sh

cd /usr/ports
ls

## getting package to install ##
printf "Listed /usr/ports directory, what to install?"
read input
if [ -d "$input" ]; then
  cd $input

## fetching package from URL if needed ##
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

## actual installation section ##
printf "Does this package require the 'make install' command? [y/n]"
read yn
if [ $yn = "y" ]; then
  ## Hack to fix subdirectories ##
  if [ -f "Makefile" ]; then
    sudo make && make install
  elif [ ! -f "Makefile" ]; then
    ls
    printf "octo couldn't find a makefile, so you need to manually specify one the folders printed above that contains the makefile."
    read mflocation
    cd $mflocation
    sudo make && make install
  fi
elif [  $yn = "n" ]; then
  ## Hack to fix subdirectories ##
  if [ -f "Makefile" ]; then
    sudo make
  elif [ ! -f "Makefile" ]; then
    ls
    printf "octo couldn't find a makefile, so you need to manually specify one of the folders printed above that contains the makefile.\n"
    read mflocation
    cd $mflocation
    sudo make
  fi
else
  printf "Please type 'y' or 'n':"
fi
