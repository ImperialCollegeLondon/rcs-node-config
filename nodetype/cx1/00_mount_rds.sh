

RDS=hpc.rds.ic.ac.uk

mkdir /rds/general
chmod a+rx /rds/general
chmod a+rx /rds
ln -s /rds /rdsgpfs

mount -t nfs -o sync,mountvers=3,nfsvers=3,nodev,nosuid,rsize=1048576,wsize=1048576 $RDS:/rds/general /rds/general 

