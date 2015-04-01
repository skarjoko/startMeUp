#!/bin/bash

#--------------------------OPTIONAL PARAMETERS------------------------#

#---------------------------------------------------------------------#

#-----------------------OS AND SUDO AUTHERIZATION---------------------#
echo "Please enter the password for your local machine."
USEROS=$(sudo uname)
#---------------------------------------------------------------------#
echo "The current operating system you are using is: $USEROS"

if [ "$USEROS" = "Darwin" ]; then
    echo "Installing Xcode"
    xcode-select --install
    read -p "Please follow the instructions for installing Xcode. Once it has completed, press [Enter] key to continue..."
    echo "Installing Homebrew"
    sh install_homebrew.sh
    brew doctor
    echo "Installing mysql"
    brew install mysql
    echo "Installing vagrant"
    brew install Caskroom/cask/vagrant
    echo "Installing and linking GCC"
    brew tap homebrew/versions && brew tap homebrew/dupes && brew install apple-gcc42
    sudo ln -nsf $(which gcc-4.2) /usr/bin/gcc-4.2
    echo "Applying mysql config file"
    sudo cp OSX/my.cnf /usr/local/Cellar/mysql/*/my.cnf
fi

if [ "$USEROS" = "Linux" ]; then
    echo "Installing vim"
    sudo apt-get -y install vim
    echo "Installing build essentials"
    sudo apt-get -y install build-essential curl
    echo "Installing vagrant"
    sudo apt-get -y install vagrant
    echo "Installing GPG key for RVM"
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    echo "Installing MySQL server"
    sudo apt-get -y install mysql-server
    echo "Applying mysql config file"
    sudo cp Linux/my.cnf /etc/mysql/my.cnf
fi

echo "Installing rvm"
sh install_rvm.sh

echo "Linking rvm to bash"
echo "source $HOME/.rvm/scripts/rvm" >> ~/.bash_profile

# option to install and run vagrant with AWS key
echo "Would you like to install and run your vagrant?
NOTE: You need an AWS key and secret key in order to proceed. [y/n]"
read VAGRANT_ANSWER
if [ "$VAGRANT_ANSWER" = "y" ] || [ "$VAGRANT_ANSWER" = "Y" ]; then
    sh install_vagrant.sh
fi

echo "Please restart your terminal in order to apply the RVM changes."
