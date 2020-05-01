# Install route to GPFS network
ip route add 172.16.0.0/255.255.255.192 via 10.148.0.2

# Install the RPMs
rpm -ivh /usr/local/gpfs/*rpm

# Fixup th symlink
rm /rds/general
rm /rds
ln -s /rdsgpfs /rds

##Build GPFS GPL
/usr/lpp/mmfs/bin/mmbuildgpl
/usr/lpp/mmfs/bin/mmstartup
# Block until GPFS is up

while [ ! -e /rds/general/user ]; do
	echo "Sleeping for 30s until GPFS ready"			
  sleep 30
done
~                                   
