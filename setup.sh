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
    sh install_homebrew.sh
fi

if [ "$USEROS" = "Linux" ]; then
    echo Installing vim
    $(sudo apt-get -y install vim)
    echo Installing build essentials
    $(sudo apt-get -y install build-essential curl)
fi

echo Installing rvm
sh install_rvm.sh

echo Linking rvm to bash
source $HOME/.rvm/scripts/rvm
echo "source $HOME/.rvm/scripts/rvm" >> ~/.bash_profile
