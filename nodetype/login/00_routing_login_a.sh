#!/bin/sh

## Setup v6 networking for muti-homes login nodes
## ASSUMES the following
## Default v6 route is on eth0
## 192.168 1G network is on eth1 - defroute is off 
## 100G v6 only network is on eth2 and is on subnet a08 - defroute is off
## v6 routing for 2a0c:5bc0:89:a00::/56 is via eth2

##RDIS executable for rdisc6
RDISC6="/usr/local/ndisc6-0.7.1/bin/rdisc6"

#Host to run on
AUTHORISED_HOST="login-a"

if [ ! -f ${RDISC6} ]; then
	echo "No file ${RDISC6}"
	exit 1
fi

##only on correct host
if [ "$(hostname -s)" != "${AUTHORISED_HOST}" ]; then
  echo "Host is not login-a - exiting"
  exit 1
fi

##The interfaces you do not want to have a default route
for INTERFACE in eth1 eth2;do

	echo "Doing ${INTERFACE}"

	## enable the interface for autoconfig
	/usr/sbin/sysctl net.ipv6.conf.${INTERFACE}.accept_ra=1

	##Force the innterface to renew IPv6
	${RDISC6}  -1 ${INTERFACE} > /dev/null

	##Delete the unwanted route
	/usr/sbin/ip -6 route del default dev ${INTERFACE}

	##Disable the interface for autoconfig
	/usr/sbin/sysctl net.ipv6.conf.${INTERFACE}.accept_ra=0
done

### Add route for GPFS traffic
ip -6 route add 2a0c:5bc0:89:a00::/56  via 2a0c:5bc0:89:a08::1

## Addroute for IB routing machine (quorum1)
ip route add to 10.148.0.0/16 via 192.168.102.218
