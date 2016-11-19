#!/bin/sh

# no $OCTODIR failsafe
if [ -d "$OCTODIR" ]; then
  cd $OCTODIR
  ls
else
  printf "the octo packages directory does not exist, run installer.sh to configure it.\n"
  exit
fi

## getting package to install ##
printf "Listed octo packages directory, what to install?"
read input
if [ -d "$input" ]; then
  cd $input

## parsing and package installation ##
else
  printf "Package does not exist! Would you like to fetch the package from the main repository? [y/n]\n"
  read yn
  if [ $yn = "y" ]; then
    if [ -f "/etc/octo/pkgs.conf"]; then
      packagename=$(grep -i $input /etc/octo/pkgs.conf)
        if [ $packagename = '']; then
          printf "package does not exist, exiting..."
          exit
        fi
      packageurl=$(grep -i $input"url" /etc/octo/pkgs.conf)
        if [ $packageurl = '']; then
          printf "package url is broken, exiting..."
          exit
        fi
  elif [ $yn = "n" ]; then
    printf "'n' argument given, exiting..\n"
    exit
  else
    printf "Please type 'y' or 'n':\n"
  fi
fi

## actual installation section ##
printf "Does this package require the 'make install' command? [y/n]\n"
read yn

if [ $yn = "y" ]; then
  ## Hack to fix subdirectories ##
  if [ -f "Makefile" ]; then
    sudo make && make install
  elif [ ! -f "Makefile" ]; then
    ls
    printf "Couldn't find makefile! Please specify makefile location.\n"
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
    printf "Couldn't find makefile! Please specify makefile location.\n"
    read mflocation
    cd $mflocation
    sudo make
  fi
else
  printf "Please type 'y' or 'n': "
fi
