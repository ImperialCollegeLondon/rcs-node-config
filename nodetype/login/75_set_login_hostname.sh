#!/bin/bash

## We assume that eth0 is the interface that the DNS is set on. 
IPv6=$(ip -6 addr show dev eth0 | egrep -o "2a0c:[a-z0-9:]*")

#Because configuration expects cx3 to follow a given pattern, any login-x address has to be an alias and so we have to look for it.
for i in dev {a..z};do
    TEST_IP=`/usr/bin/dig login-${i}.hpc.ic.ac.uk AAAA +short`
    if [ "${CUURENTIP}" == "${V6IP}" ];then
        hostname login-${i}
        break 
    fi 
done
