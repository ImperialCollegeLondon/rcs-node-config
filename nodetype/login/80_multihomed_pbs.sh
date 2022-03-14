#!/bin/sh

## Setup hosts so that PBS works on login-a


#Host to run on
AUTHORISED_HOST="login-a"


##only on correct host
if [ "$(hostname -s)" != "${AUTHORISED_HOST}" ]; then
  echo "Host is not login-a - exiting"
  exit 1
fi

##Do pbs.conf
sed -i 's/PBS_SERVER=pbs-cx3/PBS_SERVER=pbs/g' /etc/pbs.conf

##Then Hosts
sed -i 's/##192.168.101.250 pbs1 pbs/192.168.101.250 pbs1 pbs/g' /etc/hosts
sed -i 's/10.149.16.100   pbs-cx3 pbs/10.149.16.100   pbs-cx3/g' /etc/hosts

#Put sssd back on track
sed -i 's/ipv6_only/ipv4_only/g' /etc/sssd/sssd.conf
service sssd restart

