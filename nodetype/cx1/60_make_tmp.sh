#!/bin/bash
# MJH 4/9/2019 -- if the / is a /tmpfs, bind mount RDS ephemeral/tmpdir onto /tmp
# If there is another partition then assume it is to be used as a local /tmp

mount_tmp (){
  unlink /var/tmp
  mv /tmp /var/tmp
  chmod 755 /var/tmp
  mkdir /tmp
  # Remember stick bit so users can't delete tmp by mistake
  mount ${1} /tmp
  chmod 1777 /tmp
}

if grep -q nvme0n2 /proc/partitions  ; then
  mount_tmp /dev/nvme0n2
elif grep -q sda2 /proc/partitions ; then
  mount_tmp /dev/sda2
else
	mount | grep -q "tmpfs on / "
	if [ "$?" == "0" ]; then
		mount -o bind /rds/general/ephemeral/tmpdir /tmp
	  chmod 0755 /tmp
	fi
fi
