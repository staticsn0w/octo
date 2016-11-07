#!/bin/sh

printf "This is the octo installer: [ENTER] to start the install, any other key to abort.\n"
read -s -n 1 input
if [[ -z $input ]]; then
  
  ## $OCTODIR setup ##
  if [ ! -d "$OCTODIR" ]; then
    printf "there is no octo package directory set, where would you like to use as your package directory?\n"
    read temp
    printf "$temp ? are you sure? [y/n]"
    read yn
    if [ $yn = "y" ]; then
      sudo echo "export OCTODIR=$temp" >> ~/.bash_profile
      sudo echo "export OCTODIR=$temp" >> /root/.bash_profile
      sudo mkdir $temp
    if [ $yn = "n" ]; then
      printf "re-run install.sh to pick the right dir"
      exit
  fi

  ## octo binary installation ##
  sudo chmod +x octo
  sudo cp octo /bin
  printf "Done! Run 'octo' to confirm everything is working correctly.\n"
else
  printf "Aborting...\n"
  exit
fi
