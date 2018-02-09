#!/bin/sh

here=`dirname $0`
basedir=$here/..

sudo yum update -y
$here/inst-docker.sh