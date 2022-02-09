#!/bin/bash


## configure connected mode on any ib interface
if [ -e  /sys/class/net/ib0/mode ]; then
	echo "connected" >  /sys/class/net/ib0/mode
	ifconfig ib0 mtu 65520
fi


# ib0 really ought to be treated like any other network interface
# However, because dhcp is not supported, we key the IP address from
# the setting for eth0

# CX1's ethernet fabric uses 192.168.96.0/21, so we'll use the next subnet 
# 192.168.104.0/21 for the IB fabric.

# This script will probably come back to bite me in the arse one day.

# MJH 28 Sept 2006.

# This script has bitten me in the arse.

# MJH 1 May 07


# MJH 10 Jun 2014 - Configure ib1 as well

export SET_IP=1

# Check the PCI manifest to see if there's an adapter present

#/sbin/lspci -n | grep -q 15b3:6

#if [ "$?" == "1" ]; then
#	# No adapter present
#	exit
#fi



if [ "$SET_IP" == "0" ]; then
	exit
fi

# check to see  if ib0 is present


/sbin/ifconfig ib0 > /dev/null 2>&1

if [ "$?" == "1" ];then
	echo "No Infiniband interface present"
	exit;
fi


## Confides because of the clat interface so forcing to eth0
##ETHDEV=`/sbin/route -n | grep -e "^0.0.0.0" | awk '{print $8}'`
ETHDEV=eth0

ETH0_ADDR=`/sbin/ifconfig ${ETHDEV} | grep "inet " | awk '{print $2}' `

OCT_1=`echo "${ETH0_ADDR}" | cut -d. -f1`
OCT_2=`echo "${ETH0_ADDR}" | cut -d. -f2`
OCT_3=`echo "${ETH0_ADDR}" | cut -d. -f3`
OCT_4=`echo "${ETH0_ADDR}" | cut -d. -f4`

let IB_OCT_3=${OCT_3}+8

if [ "${OCT_1}" != "192" ]; then
	echo "Failure";
	exit;
fi

IB_ADDR="192.168.${IB_OCT_3}.${OCT_4}"

/sbin/ifconfig ib0 ${IB_ADDR} netmask 255.255.248.0
/sbin/ifconfig ib0 up

#let IB_OCT_3=${IB_OCT_3}+8
#IB_ADDR="192.168.${IB_OCT_3}.${OCT_4}"
#/sbin/ifconfig ib1 ${IB_ADDR} netmask 255.255.248.0
#/sbin/ifconfig ib1 up
	
/sbin/route add -net 192.168.104.0 netmask 255.255.248.0 ib0 2> /dev/null
#/sbin/route add -net 192.168.112.0 netmask 255.255.248.0 ib0 2> /dev/null


# Now set ARP timeout sysctls, as recommened by Intel (Issue#411707 )

/sbin/sysctl -w net.ipv4.neigh.ib0.base_reachable_time=14400
/sbin/sysctl -w net.ipv4.neigh.ib1.base_reachable_time=14400
