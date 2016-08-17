#!/bin/bash

version="$1"

if [ -z "${version}" ]; then
	echo "No version set, is this really what you want?"
	sleep 5
fi

for c in bacula-db bacula-db-data bacula-sd bacula-dir bacula-fd; do
	imgname=`echo ${c} | sed 's,^bacula,bacula-opensource,'`
	docker build --no-cache -t romracer/${imgname}:latest -f ${c}/Dockerfile .
	if [ ! -z "${version}" ]; then
		docker build --no-cache -t romracer/${imgname}:${version} -f ${c}/Dockerfile .
	fi
done

