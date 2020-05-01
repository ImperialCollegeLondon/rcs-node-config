#!/bin/sh

echo "

127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6

172.16.0.1      imperial-man1.pixstor   imperial-man1
172.16.0.2      imperial-man2.pixstor   imperial-man2
172.16.0.3      imperial-man3.pixstor   imperial-man3
172.16.0.4      imperial-nsd1.pixstor   imperial-nsd1
172.16.0.5      imperial-nsd2.pixstor   imperial-nsd2
172.16.0.6      imperial-nsd3.pixstor   imperial-nsd3
172.16.0.7      imperial-nsd4.pixstor   imperial-nsd4
172.16.0.10     imperial-gw1.pixstor    imperial-gw1
172.16.0.11     imperial-gw2.pixstor    imperial-gw2
172.16.0.12     imperial-gw3.pixstor    imperial-gw3
172.16.0.13     imperial-gw4.pixstor    imperial-gw4
172.16.0.14     imperial-gw5.pixstor    imperial-gw5
172.16.0.15     imperial-gw6.pixstor    imperial-gw6

192.168.101.250 pbs1    pbs
192.168.101.251 pbs2

10.148.254.3    pbs-cx2
10.149.16.100   pbs-cx3

10.148.254.5    login-4.ib0.cx2.hpc.ic.ac.uk    login-4 login-4-internal
10.148.254.6    login-5.ib0.cx2.hpc.ic.ac.uk    login-5 login-5-internal
10.148.254.7    login-6.ib0.cx2.hpc.ic.ac.uk    login-6 login-6-internal
10.148.254.8    login-7.ib0.cx2.hpc.ic.ac.uk    login-7 login-7-internal
10.148.254.9    login-8.ib0.cx2.hpc.ic.ac.uk    login-8 login-8-internal
10.148.254.11   dtn2.ib0.cx2.hpc.ic.ac.uk       dtn2    dtn2-internal
10.148.254.10   login-9.ib0.cx2.hpc.ic.ac.uk    login-9 login-9-internal
10.148.254.12   dtn1.ib0.cx2.hpc.ic.ac.uk       dtn1    dtn1-internal
10.148.252.1    quorum1.ib0.cx2.hpc.ic.ac.uk
10.148.252.2    quorum2.ib0.cx2.hpc.ic.ac.uk
10.148.252.3    quorum3.ib0.cx2.hpc.ic.ac.uk
" > /etc/hosts
