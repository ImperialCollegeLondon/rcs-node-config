#!/bin/bash

#Using script in /root as the rcs-node-config is public and the registration script has a private key
/root/reg-with-sate.sh

#Will need epel for updates. Following advice from https://www.redhat.com/en/blog/whats-epel-and-how-do-i-use-it
ARCH=$( /bin/arch )
subscription-manager repos --enable "codeready-builder-for-rhel-8-${ARCH}-rpms"
yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

#Install dnf-automatic. https://access.redhat.com/solutions/2823901
dnf -y install dnf-automatic
##By default updates are only downloaded. Setting to install them as well.
sed -i "s/apply_updates = no/apply_updates = yes/g" /etc/dnf/automatic.conf

#Exclude kernel updates as these are incompatable with GPFS
echo "exclude=kernel* redhat-release* kmod-kvdo" >> /etc/yum.conf

# Run updates on a Tuesday morning
cat > usr/lib/systemd/system/dnf-automatic.timer << EOF
[Unit]
Description=rcs-dnf-automatic timer
# See comment in dnf-makecache.service
ConditionPathExists=!/run/ostree-booted
Wants=network-online.target

[Timer]
OnCalendar=Tue *-*-* 6:00
RandomizedDelaySec=60m
Persistent=true

[Install]
WantedBy=timers.target
EOF

# Run once now and then start timer
/usr/bin/dnf-automatic /etc/dnf/automatic.conf
systemctl enable --now dnf-automatic.timer 
