import os

# no $OCTODIR failsafe
os.system("if [ -d "$OCTODIR" ]; then
             cd $OCTODIR
             ls
           else
             printf "the octo packages directory does not exist, run installer.sh to configure it."
             exit
           fi

## getting package to install ##
printf "Listed octo packages directory, what to install?"
read input
if [ -d "$input" ]; then
  cd $input

## fetching package from URL if needed ##
else
  printf "Package does not exist! Would you like to fetch the package from a URL? [y/n]\n"
  read yn
  if [ $yn = "y" ]; then
    printf "Input URL.. (must be tar.gz)\n"
    read pkglocation
    sudo mkdir $input && sudo wget -O octo.tar.gz $pkglocation && sudo tar xf temp.tar.gz -C $input && sudo rm temp.tar.gz && cd $input
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
")
