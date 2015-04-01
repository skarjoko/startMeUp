#!/bin/bash
echo "Before continuing, please ensure that you have generated an SSH key."

echo "Installing vagrant aws plugin"
vagrant plugin install vagrant-aws

echo "Installing vagrant dummy box"
vagrant box add dummy https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box

echo "Please input your SSH username: "
read SSH_USERNAME

echo "Please put in your AWS Access Key: "
read AWS_ACCESS_KEY
echo "export AWS_ACCESS_KEY='$AWS_ACCESS_KEY' >> ~/.bash_profile"

echo "Please put in your AWS Secret Access Key: "
read AWS_SECRET_ACCESS_KEY
echo "export AWS_SECRET_ACCESS_KEY='$AWS_SECRET_ACCESS_KEY' >> ~/.bash_profile"

echo "Please put in the AMI provided by the sysadmin: "
read AWS_AMI

sed -i "s/aws.ami = .*/aws.ami = \"$AWS_AMI\"/" Vagrantfile
sed -i "s/override.ssh.username = .*/override.ssh.username = \"$SSH_USERNAME\"/" Vagrantfile
sed -i "s/override.ssh.private_key_path = .*/override.ssh.private_key_path = /Users/$USER/.ssh/id_rsa"  


