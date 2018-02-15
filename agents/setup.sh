#!/bin/sh

#############################################################################
# Licensed Materials - Property of HCL*
# (C) Copyright HCL Technologies Ltd. 2017, 2018 All rights reserved.
# * Trademark of HCL Technologies Limited
#############################################################################

here=`dirname $0`
basedir=$here/..

. ${basedir}/common/func.sh
. ${WAHOME}/twa_env.sh

imgname="workload-scheduler-agent"
imgversion="9.4.0.01"
tarfile="${imgname}.${imgversion}.tar"

#echo Removing old containers
#docker-compose -f $here/docker-compose.yml down

echo Removing existing Workstations

sudo su - waadmin -c 'composer "delete ws=DOCKERAGT@; noask"; JnextPlan -for 0000 -noremove'

mkdir -p /tmp/demo

#Check if agent docker image already available
if [ `docker images -q ${imgname}:${imgversion} | wc -l` -lt 1 ]; then
	curl -o /tmp/demo/${tarfile}.gz http://10.14.37.145/${tarfile}.gz
	gunzip /tmp/demo/${tarfile}.gz
	sudo su - wauser -c "docker load -i /tmp/demo/${tarfile}"
	rm /tmp/demo/${tarfile}*
fi

#Open Ports on local firewall
sudo firewall-cmd --zone=public --add-port=31116/tcp --permanent
sudo firewall-cmd --reload

#Create and start containers
sudo su - wauser -c "docker-compose -f $PWD/$here/docker-compose.yml up -d"

