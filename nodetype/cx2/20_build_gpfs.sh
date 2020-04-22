##Build GPFS GPL
/usr/lpp/mmfs/bin/mmbuildgpl

# Block until GPFS is up

while [ ! -e /rds/general/user ]; do
	echo "Sleeping for 30s until GPFS ready"			
  sleep 30
done
~                                   
