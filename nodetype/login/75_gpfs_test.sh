#!/bin/bash 

HOSTNAME=`hostname`

## Rack by Rack inroduction to GPFS over v6
## cx3-1
if [[ $HOSTNAME == cx3-1-* ]];then
	##Remove old mount 
	umount /rds/general

	## Build ther GPFS kernel modules
	/usr/lpp/mmfs/bin/mmbuildgpl

	##Remove NFS mount - needed when Multi-cluster is setup
	##umount /rds/general

	##Mount rds via gpfs
	/usr/lpp/mmfs/bin/mmstartup

fi
## cx3-2
if [[ $HOSTNAME == cx3-2-* ]];then
	##Remove old mount 
	umount /rds/general

	## Build ther GPFS kernel modules
	/usr/lpp/mmfs/bin/mmbuildgpl

	##Remove NFS mount - needed when Multi-cluster is setup
	##umount /rds/general

	##Mount rds via gpfs
	/usr/lpp/mmfs/bin/mmstartup

fi

## cx3-3
if [[ $HOSTNAME == cx3-3-* ]];then
	##Remove old mount 
	umount /rds/general

	## Build ther GPFS kernel modules
	/usr/lpp/mmfs/bin/mmbuildgpl

	##Remove NFS mount - needed when Multi-cluster is setup
	##umount /rds/general

	##Mount rds via gpfs
	/usr/lpp/mmfs/bin/mmstartup

fi

## cx3-4
if [[ $HOSTNAME == cx3-4-* ]];then
	##Remove old mount 
	umount /rds/general

	## Build ther GPFS kernel modules
	/usr/lpp/mmfs/bin/mmbuildgpl

	##Remove NFS mount - needed when Multi-cluster is setup
	##umount /rds/general

	##Mount rds via gpfs
	/usr/lpp/mmfs/bin/mmstartup

fi


## cx3-5
if [[ $HOSTNAME == cx3-5-* ]];then
	##Remove old mount 
	umount /rds/general

	## Build ther GPFS kernel modules
	/usr/lpp/mmfs/bin/mmbuildgpl

	##Remove NFS mount - needed when Multi-cluster is setup
	##umount /rds/general

	##Mount rds via gpfs
	/usr/lpp/mmfs/bin/mmstartup

fi

## cx3-6
if [[ $HOSTNAME == cx3-6-* ]];then
	##Remove old mount 
	umount /rds/general

	## Build ther GPFS kernel modules
	/usr/lpp/mmfs/bin/mmbuildgpl

	##Remove NFS mount - needed when Multi-cluster is setup
	##umount /rds/general

	##Mount rds via gpfs
	/usr/lpp/mmfs/bin/mmstartup

fi



## cx3-7
if [[ $HOSTNAME == cx3-7-* ]];then
	##Remove old mount 
	umount /rds/general

	## Build ther GPFS kernel modules
	/usr/lpp/mmfs/bin/mmbuildgpl

	##Remove NFS mount - needed when Multi-cluster is setup
	##umount /rds/general

	##Mount rds via gpfs
	/usr/lpp/mmfs/bin/mmstartup

fi



## cx3-10
if [[ $HOSTNAME == cx3-10-* ]];then
	##Remove old mount 
	umount /rds/general

	## Build ther GPFS kernel modules
	/usr/lpp/mmfs/bin/mmbuildgpl

	##Remove NFS mount - needed when Multi-cluster is setup
	##umount /rds/general

	##Mount rds via gpfs
	/usr/lpp/mmfs/bin/mmstartup

fi


