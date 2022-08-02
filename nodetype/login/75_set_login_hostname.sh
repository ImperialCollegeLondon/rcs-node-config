#!/bin/bash
hostname login-a
exit
## We assume that eth0 is the interface that the DNS is set on.
IPv6=$(ip -6 addr show dev eth0 | egrep -o "2a0c:[a-z0-9:]*")

# Because configuration expects cx3 to follow a given pattern, any login-x address has to be an alias and so we have to look for it.
# Dev nodes follow a different pattern to production login

TEST_IP=$(/usr/bin/dig login-dev.cx3.hpc.ic.ac.uk AAAA +short)
if [ "${TEST_IP}" == "${IPv6}" ];then
    hostname login-dev
else
	for i in {a..c} ;do
	    TEST_IP=`/usr/bin/dig login-${i}.hpc.ic.ac.uk AAAA +short`
	    if [ "${TEST_IP}" == "${IPv6}" ];then
	        hostname login-${i}
	        break
	    fi
	done    
fi
