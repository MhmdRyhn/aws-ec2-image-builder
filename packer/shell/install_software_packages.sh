#!/bin/bash

set -e
set -x

sudo apt-get update -y
sudo apt-get install -y apache2 libapache2-mod-wsgi

sudo touch /var/www/html/index.html
sudo chmod 777 /var/www/html/index.html

echo "<h1>The apache2 server has been set up in this instance's AMI using Hashicorp's Packer.</h1>" > /var/www/html/index.html
