#!/bin/bash

for i in {a..z};do

	## We assume that eth0 is the interface that the DNS is set on
	## get the IP
	V6IP=`ip -6 addr show dev eth0 | grep inet6 | awk '{print $2}' | grep 2a0c | sed s/\\\/64//`

	CUURENTIP=`/usr/bin/dig login-${i}.hpc.ic.ac.uk AAAA +short`

	if [ "${CUURENTIP}" == "${V6IP}" ];then

		hostname login-${i}
		break 

	fi 

done
