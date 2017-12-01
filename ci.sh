#!/bin/bash

########################
# Java, Maven, Git
########################
echo "Installing Java, Maven, Git"
sudo apt-get -y install python-software-properties  > /dev/null 2>&1
sudo apt-add-repository ppa:webupd8team/java  > /dev/null 2>&1
sudo apt-get update > /dev/null 2>&1
sudo apt-get -y install oracle-java8-installer > /dev/null 2>&1
sudo apt-get -y install git maven2 > /dev/null 2>&1



########################
# Jenkins
########################
echo "Installing Jenkins"
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update > /dev/null 2>&1
sudo apt-get -y install jenkins > /dev/null 2>&1

########################
# nginx
########################
echo "Installing nginx"
sudo apt-get -y install nginx > /dev/null 2>&1
sudo service nginx start

########################
# Configuring nginx
########################
echo "Configuring nginx"
cd /etc/nginx/sites-available
sudo rm default ../sites-enabled/default
sudo cp /vagrant/VirtualHost/jenkins /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/jenkins /etc/nginx/sites-enabled/
sudo service nginx restart
sudo service jenkins restart
echo "Success"
