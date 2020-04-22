
## cx1-15-1-{1,2,3} Supermicro GPU machines - SATA fails if power management enabled

for T in /sys/class/scsi_host/host*/link_power_management_policy; do echo "max_performance" > $T; done

