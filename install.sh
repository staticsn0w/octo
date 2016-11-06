#!/bin/sh

printf "this is the octo installer, press [ENTER] to install, and any other key to abort the install.\n"
read -s -n 1 input
if [[ -z $input ]]; then
  if [ ! -d "/usr/ports" ]; then
    sudo mkdir /usr/ports
  fi

  sudo cp octo /bin
  printf "Done! Run 'octo' to confirm everything is working correctly.\n"
else
  printf "[ENTER] not pressed, aborting...\n"
fi
