# Block until GPFS is up

while [ ! -e /rds/general/user ]; do
	sleep 5
done
