

RDS=hpc-ib.rds.ic.ac.uk

mkdir /rds
mkdir /rds/general
mkdir /rds/easybuild
chmod a+rw /rds/easybuild
chmod a+rx /rds/general
chmod a+rx /rds
ln -s /rds /rdsgpfs

# not noac, too many stat-heavy things run on cx1 nodes
# Using if statements to prevent double mounting.
if ! df  | grep -q "${RDS}:/rds/general"; then
  mount -t nfs -o sync,noac,mountvers=3,nfsvers=3,nodev,nosuid,rsize=1048576,wsize=1048576 $RDS:/rds/general /rds/general
fi
if ! df  | grep -q "${RDS}:/rds/easybuild"; then
  mount -t nfs -o sync,noac,mountvers=3,nfsvers=3,nodev,nosuid,rsize=1048576,wsize=1048576 $RDS:/rds/easybuild /rds/easybuild/
fi
