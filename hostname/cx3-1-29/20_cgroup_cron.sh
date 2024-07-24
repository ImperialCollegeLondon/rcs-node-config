#!/bin/bash
# Only run on Interactive nodes like OOD
echo "*/10 * * * * root /opt/pbs/custom/cgroups-limits.sh" > /etc/cron.d/simple-cgroups.sh
chmod 644 /etc/cron.d/simple-cgroups.sh
dnf -y install libcgroup-tools
