

RDS=hpc.rds.ic.ac.uk

mkdir /rds
mkdir /rds/general
chmod a+rx /rds/general
chmod a+rx /rds
ln -s /rds /rdsgpfs

# not noac, too many stat-heavy things run on cx1 nodes
mount -t nfs -o mountvers=3,nfsvers=3,nodev,nosuid,rsize=65536,wsize=65536 $RDS:/rds/general /rds/general 

