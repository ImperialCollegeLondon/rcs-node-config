
### MJH 25/3/2020 -- deterministically assign an RDS NFS mount IP based on unit # (cx3-X-#)

mkdir /rds
mkdir /rds/general
chmod a+rx /rds
chmod a+rx /rds/general
ln -s /rds /rdsgpfs



## Check if we have moved to GPFS 
## Just a listing now - better test later
if [[ $HOSTNAME == cx3-[1-8]-* ]];then

  GPFS_NODE=1

elif  [[ $HOSTNAME =~ cx3-[10-15]-* ]];then

  GPFS_NODE=1

else

  GPFS_NODE=""

fi


if [ $GPFS_NODE ];then
  echo "Node $HOSTNAME is a GPFS node"
  echo "Mounting GPFS"

	## Build the GPFS kernel modules
	/usr/lpp/mmfs/bin/mmbuildgpl

	##Mount rds via gpfs
	/usr/lpp/mmfs/bin/mmstartup
	
else
  echo "Node $HOSTNAME is NOT a GPFS node"
  echo "Mounting NFS"


	RDS=hpc6.rds.ic.ac.uk

	LEN=$(host $RDS | wc -l)
	echo "There are $LEN IPs for $RDS"

	HN=$(hostname -s)

	echo $HN | grep -q cx3

if [ "$?" == "0" ]; then 
		let N=$(echo $HN | sed 's/cx3-[0123456789]*-//g')+1
		while [ $N -gt $LEN ]; do let N=N-LEN; done; 

		IP=$(host $RDS | sort | head -$N | tail -1 | sed 's/^.*address //g')
		IP="[$IP]"
		echo "Host $HN  mounting $RDS at $IP"

		# not noac because jobs on this partition are very statty, not doing multinode mpiio
		mount -t nfs -o sync,mountvers=3,nfsvers=3,nodev,nosuid,rsize=1048576,wsize=1048576 $IP:/rds/general /rds/general 
	else
		echo "not a cx3 node"
	fi

fi

