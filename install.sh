#!/bin/sh

if [! -d "/usr/ports" ]; then
  sudo mkdir /usr/ports
fi

sudo cp octo /bin
