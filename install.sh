#!/bin/sh

printf "this is the octo installer, press [ENTER] to install, and any other key to abort the install."
read -s -n 1 input
if [ $input = "\x0a" ]; then
  if [ ! -d "/usr/ports" ]; then
    sudo mkdir /usr/ports
  fi

  sudo cp octo /bin
  printf "Done! Run 'octo' to confirm everything is working correctly."
else
  printf "[ENTER] not pressed, aborting..."
fi
