#!/bin/bash
echo "Please input the ABSOLUTE path in which this repository will be stored: "
read FLYERS_PATH

if [ ! -d $FLYERS_PATH ]; then
    mkdir -p $FLYERS_PATH;
fi;

cd $FLYERS_PATH
git clone git@github.com:wishabi/flyers.git
cd flyers
rvm install ruby-1.9.3-p194
rvm use ruby-1.9.3-p194
rvm gemset create deploy
rvm gemset use deploy
gem install capistrano -v 2.12.0
gem install newrelic_rpm
