#!/bin/sh

## Route to legacy 1G v4 network - via quorum1
ip route add 192.168.96.0/21 via 10.148.252.1
