
# Start an Infiniband SM if the first or second node in a Supero chassis
# (for failover in case we need to reset a node)
modprobe ib_umad

nohup /usr/sbin/opensm -B &


