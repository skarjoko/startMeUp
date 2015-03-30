#!/bin/bash

#--------------------------OPTIONAL PARAMETERS------------------------#

#---------------------------------------------------------------------#

#-----------------------OS AND SUDO AUTHERIZATION---------------------#
echo 'Please enter the password for your local machine.'
USEROS=$(sudo uname)
#---------------------------------------------------------------------#
echo The current operating system you are using is: $USEROS

if [ "$USEROS" = "Darwin" ]; then
    echo Installing Xcode
    $(xcode-select --install)
    echo Installing Homebrew
    $(ruby -e “$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)”) 
fi

if [ "$USEROS" = "Linux" ]; then
    echo Installing vim
    $(sudo apt-get -y install vim)
    echo Installing build essentials
    $(sudo apt-get -y install build-essential curl)
fi

echo Installing rvm
$(curl -sSl https://get.rvm.io | bash -s stable)

echo Linking rvm to bash
echo "source $HOME/.rvm/scripts/rvm" >> ~/.bash_profile
