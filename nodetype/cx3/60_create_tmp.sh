#!/bin/bash
# If there is another partition then assume it is to be used as a local /tmp

mount_tmp (){
  unlink /var/tmp
  mv /tmp /var/tmp
  chmod 755 /var/tmp
  mkdir /tmp
  # Remember stick bit so users can delete tmp by mistake
  mount ${1} /tmp
  chmod 1777 /tmp
}

if grep -q nvme0n1p2 /proc/partitions  ; then 
  mount_tmp /dev/nvme0n1p2
elif grep -q sda2 /proc/partitions ; then
  mount_tmp /dev/sda2
else
  chmod 755 /tmp
fi
