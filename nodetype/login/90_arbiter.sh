#!/bin/bash
#Only setup to run on RHEL 8 login nodes
if grep "REDHAT_SUPPORT_PRODUCT_VERSION" /etc/os-release | grep -q 8 ; then
    mkdir -p /opt/arbiter2-2.0.0/logs/`hostname`/plots
    chown -R arbiter: /opt/arbiter2-2.0.0/
    chmod 770 /opt/arbiter2-2.0.0/logs
    systemctl --now enable arbiter2
    cd /opt/arbiter2-2.0.0/tools/
    ./allusers_corraller.sh
fi
