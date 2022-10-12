

RDS=hpc.rds.ic.ac.uk

mkdir /rds
mkdir /rds/general
mkdir /rds/easybuild
chmod a+rw /rds/easybuild
chmod a+rx /rds/general
chmod a+rx /rds
ln -s /rds /rdsgpfs

# not noac, too many stat-heavy things run on cx1 nodes
# Using if statements to prevent double mounting. 
if ! df  | grep -q "hpc.rds.ic.ac.uk:/rds/general"; then 
  mount -t nfs -o mountvers=3,nfsvers=3,nodev,nosuid,rsize=65536,wsize=65536 $RDS:/rds/general /rds/general 
fi
if ! df  | grep -q "hpc.rds.ic.ac.uk:/rds/easybuild"; then 
  mount -t nfs -o mountvers=3,nfsvers=3,nodev,nosuid,rsize=65536,wsize=65536 $RDS:/rds/easybuild /rds/easybuild/
fi
