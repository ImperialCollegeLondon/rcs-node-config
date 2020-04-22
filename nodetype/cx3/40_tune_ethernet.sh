#!/bin/bash

# MJH 2 Mar 2020 -- set ring buffer settings on eth0 (cx3)
ethtool -G eth0 rx 8192 tx 8192

# 31/7/2019 Set IRQ affinity
/usr/sbin/mlnx_affinity start

