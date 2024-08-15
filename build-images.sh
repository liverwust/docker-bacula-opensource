#!/bin/bash

version="$1"

if [ -z "${version}" ]; then
	echo "No version set, is this really what you want?"
	sleep 5
fi

#for c in bacula-db bacula-db-data bacula-sd bacula-dir bacula-fd; do
for imgname in bacula-dir; do
	docker build --no-cache -t liverwust/${imgname}:latest -f ${imgname}/Dockerfile .
	if [ ! -z "${version}" ]; then
		docker build --no-cache -t liverwust/${imgname}:${version} -f ${imgname}/Dockerfile .
	fi
done

