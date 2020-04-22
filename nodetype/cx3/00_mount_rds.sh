
### MJH 25/3/2020 -- deterministically assign an RDS NFS mount IP based on unit # (cx3-X-#)

RDS=hpc6.rds.ic.ac.uk

LEN=$(host $RDS | wc -l)
echo "There are $LEN IPs for $RDS"

HN=$(hostname -s)

echo $HN | grep -q cx3

if [ "$?" == "0" ]; then 
	let N=$(echo $HN | sed 's/cx3-[0123456789]-//g')+1
	while [ $N -gt $LEN ]; do let N=N-LEN; done; 

	IP=$(host $RDS | sort | head -$N | tail -1 | sed 's/^.*address //g')
	IP="[$IP]"
	echo "Host $HN  mounting $RDS at $IP"

	mount -t nfs -o sync,mountvers=3,nfsvers=3,nodev,nosuid,rsize=1048576,wsize=1048576 $IP:/rds/general /rds/general 
else
	echo "not a cx3 node"
fi

