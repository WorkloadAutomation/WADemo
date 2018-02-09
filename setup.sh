#!/bin/sh

basedir=`dirname $0`

components=common

for c in $components; do
	$basedir/${c}/setup.sh
done