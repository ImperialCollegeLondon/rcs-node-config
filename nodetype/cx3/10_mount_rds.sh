mkdir /rds
mkdir /rds/general
mkdir /rds/easybuild
chmod a+rw /rds/easybuild
chmod a+rx /rds/general
chmod a+rx /rds
ln -s /rds /rdsgpfs

#echo "Node $HOSTNAME is a GPFS node"
#echo "Mounting GPFS"

## Build the GPFS kernel modules
#/usr/lpp/mmfs/bin/mmbuildgpl

##Mount rds via gpfs
#/usr/lpp/mmfs/bin/mmstartup

if grep -q "cx3-17" /etc/hostname; then 
	RDS=hpc6.rds.ic.ac.uk
  echo "Mounting RDS over NFS via ${RDS}"

  # not noac, too many stat-heavy things run on HPC
  # Using if statements to prevent double mounting.
  if ! df  | grep -q "${RDS}:/rds/general"; then
    mount -t nfs -o mountvers=3,nfsvers=3,nodev,nosuid,rsize=65536,wsize=65536 $RDS:/rds/general /rds/general
  fi
  if ! df  | grep -q "${RDS}:/rds/easybuild"; then
    mount -t nfs -o mountvers=3,nfsvers=3,nodev,nosuid,rsize=65536,wsize=65536 $RDS:/rds/easybuild /rds/easybuild/
  fi
fi

