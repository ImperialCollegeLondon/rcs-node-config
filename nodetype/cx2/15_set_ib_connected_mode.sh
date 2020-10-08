#!/bin/bash


## configure connected mode on any ib interface
if [ -e  /sys/class/net/ib0/mode ]; then
        echo "connected" >  /sys/class/net/ib0/mode
        ifconfig ib0 mtu 65520
fi

if [ -e  /sys/class/net/ib1/mode ]; then
        echo "connected" >  /sys/class/net/ib1/mode
        ifconfig ib1 mtu 65520
fi


