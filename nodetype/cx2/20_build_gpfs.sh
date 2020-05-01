# Install route to GPFS network
route add 172.16.0.0 netmask 255.255.255.192 gw 10.148.0.2

##Build GPFS GPL
/usr/lpp/mmfs/bin/mmbuildgpl
/usr/lpp/mmfs/bin/mmstartup
# Block until GPFS is up

while [ ! -e /rds/general/user ]; do
	echo "Sleeping for 30s until GPFS ready"			
  sleep 30
done
~                                   
