#!/bin/bash


## Firewall for login nodes 
iptables-restore < /etc/sysconfig/iptables
