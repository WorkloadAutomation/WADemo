#!/bin/sh

#############################################################################
# Licensed Materials - Property of HCL*
# (C) Copyright HCL Technologies Ltd. 2017, 2018 All rights reserved.
# * Trademark of HCL Technologies Limited
#############################################################################

basedir=`dirname $0`

components=common

for c in $components; do
	$basedir/${c}/setup.sh
done