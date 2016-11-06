#!/bin/sh

printf "This is the octo installer: [ENTER] to start the install, any other key to abort.\n"
read -s -n 1 input
if [[ -z $input ]]; then
  if [ ! -d "/usr/ports" ]; then
    sudo mkdir /usr/ports
  fi

  sudo cp octo /bin
  printf "Done! Run 'octo' to confirm everything is working correctly.\n"
else
  printf "Aborting...\n"
fi
