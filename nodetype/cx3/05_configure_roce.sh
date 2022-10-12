#!/bin/bash

## RoCE setup
# https://community.mellanox.com/s/article/lossless-roce-configuration-for-linux-drivers-in-dscp-based-qos-mode
# https://community.mellanox.com/s/article/howto-configure-dcqcn--roce-cc--values-for-connectx-4--linux-x
# The above don't work any more
# https://mymellanox.force.com/mellanoxcommunity/s/article/lossless-roce-configuration-for-linux-drivers-in-dscp-based-qos-mode
# Just using RHEL drives.
# https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_infiniband_and_rdma_networks/configuring-roce_configuring-infiniband-and-rdma-networks
mkdir /sys/kernel/config/rdma_cm/mlx5_0
mlnx_qos -i eth0 --trust dscp
# Enable PFC on priority 3
mlnx_qos -i eth0 --pfc 0,0,0,1,0,0,0,0
# DCSP 26 + an ECN bit ( 26<<2 | 2 )
cma_roce_tos -d mlx5_0 -t 106
echo 106 > /sys/class/infiniband/mlx5_0/tc/1/traffic_class
sysctl -w net.ipv4.tcp_ecn=1
/usr/sbin/set_irq_affinity.sh eth0

