##Make sure DHCP-enabled ib0 starts
## Sleep to make sure the port has come up
# For some reason it takes some time for the IB interface to come live
sleep 60
ifup ib1
ifup ib0

