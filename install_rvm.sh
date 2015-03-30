# Install RVM
if test ! $(which rvm); then
    \curl -sSL https://get.rvm.io | bash -s stable
else
    echo "RVM is already installed!"
fi
