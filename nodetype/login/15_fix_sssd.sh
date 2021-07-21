#!/bin/bash

## A horribe horrible hack because sssd will not try both v4 and v6 ips if the first fails
## If the node's a cx3 one, only use ipv6 in sssd and restart it
hostname | grep cx3
if [ "$?" == "0" ]; then
	sed -i 's/ipv4_only/ipv6_only/g' /etc/sssd/sssd.conf
	service sssd restart
fi
