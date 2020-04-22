## === Notify configuration server that machine is up ===

# MJH 12 Api 17 -- inform configmgnt
wget  -o /dev/null --no-check-certificate https://configuration.cx1.hpc.imperial.ac.uk/status/boot/$(hostname -s)$(ls /REV*)

