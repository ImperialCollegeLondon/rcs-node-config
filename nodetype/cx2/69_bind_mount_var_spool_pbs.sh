#!/bin/sh


mount -o bind /rds/general/sys-info/node/$(hostname -s)/var/spool/PBS /var/spool/PBS

