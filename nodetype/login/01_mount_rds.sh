#!/bin/bash
#Build the kernel modules on the fly and then startup.

mkdir /rds
mkdir /rds/general
chmod a+rx /rds
chmod a+rx /rds/general
ln -s /rds /rdsgpfs

## Build the GPFS kernel modules
/usr/lpp/mmfs/bin/mmbuildgpl

##Mount rds via gpfs
/usr/lpp/mmfs/bin/mmstartup

