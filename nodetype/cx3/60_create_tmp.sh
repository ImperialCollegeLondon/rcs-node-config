#!/bin/bash
# If there is another partition then assume it is to be used as a local /tmp

mount_tmp (){
  unlink /var/tmp
  mv /tmp /var/tmp
  mkdir /tmp
  mount ${1} /tmp
  chmod 777 /tmp 

}

if grep -q nvme0n2 /proc/partitions  ; then 
  mount_tmp /dev/nvme0n2
elif grep -q sda2 /proc/partitions ; then
  mount_tmp /dev/sda2
fi
