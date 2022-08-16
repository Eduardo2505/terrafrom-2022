#!/bin/sh
sudo yum update -y
sudo yum search docker
sudo yum install docker -y

wget https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) 
sudo mv docker-compose-$(uname -s)-$(uname -m) /usr/local/bin/docker-compose
sudo chmod -v +x /usr/local/bin/docker-compose


sudo systemctl enable docker.service
#sudo systemctl start docker.service