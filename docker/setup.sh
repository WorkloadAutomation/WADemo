#!/bin/sh

#############################################################################
# Licensed Materials - Property of HCL*
# (C) Copyright HCL Technologies Ltd. 2017, 2018 All rights reserved.
# * Trademark of HCL Technologies Limited
#############################################################################

here=`dirname $0`
basedir=$here/..

sudo systemctl stop docker

sudo cp $here/daemon.json /etc/docker/daemon.json

sudo yum remove -y docker docker-common docker-engine #docker-selinux

sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
#sudo yum install -y --setopt=obsoletes=0 docker-ce-17.03.2.ce-1.el7.centos.x86_64 docker-ce-selinux-17.03.2.ce-1.el7.centos.noarch

sudo yum install -y http://mirror.centos.org/centos/7/extras/x86_64/Packages/container-selinux-2.36-1.gitff95335.el7.noarch.rpm docker-ce

sudo usermod -aG docker $USER

sudo systemctl start docker
#sudo systemctl status docker

# sudo su - wauser -c is used to get the just assigned group and run docker commands
sudo su - wauser -c "docker ps"

#install docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo su - wauser -c "docker-compose --version"