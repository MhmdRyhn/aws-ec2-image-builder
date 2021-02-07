#!/bin/bash

set -e
set -x

# Install required softwares
sudo apt-get update -y
sudo apt-get install -y apache2 apache2-utils ssl-cert
sudo apt-get install -y libapache2-mod-wsgi
sudo apt-get install -y git
# Install pip for python3
sudo apt-get install -y python3-pip
# Install virtualenv package
pip3 install virtualenv

# This directory should allow least required permissions
sudo chmod 777 /var/www/

# Following commands can be used to see if the AMI's been created as intended by launching an instance
#sudo touch /var/www/html/index.html
#sudo chmod 777 /var/www/html/index.html
#echo "<h1>The apache2 server has been set up in this instance's AMI using Hashicorp's Packer.</h1>" > /var/www/html/index.html
