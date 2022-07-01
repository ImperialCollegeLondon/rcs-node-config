#!/bin/bash

#If root isn't mounted as a tmpfs then create a 4GB swap as given by:
#https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/managing_storage_devices/getting-started-with-swap_managing-storage-devices

if  ! df / | grep -q tmpfs  ; then 
    #Create file if missing
    if [ ! -e /tmp/.SWAPFILE ]; then
        dd if=/dev/zero of=/tmp/.SWAPFILE count=1 bs=4G
        chmod 600 /tmp/.SWAPFILE
        /sbin/mkswap -v1 /tmp/.SWAPFILE
    fi
    /sbin/swapon /tmp/.SWAPFILE
fi
