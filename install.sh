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

  ## octo installation ##
  sudo chmod +x octo
  sudo cp octo /bin
  ## setting up /etc/octo/pkgs.list ##
  sudo mkdir /etc/octo
  sudo touch /etc/octo/pkgs.list
  sudo echo 'Package="octo", Version="1.0.0", URL="https://github.com/staticsn0w/octo/releases/download/v1.0.0/octo-v1-0-0.tar.gz";\nPackage="HelloOcto", Version="1.0", URL="testurl.url";\n' >> /etc/octo/pkgs.list
  printf "Done! Run 'octo -u' to confirm update your sources and confirm everything is working.\n"
else
  printf "Aborting...\n"
  exit
fi
