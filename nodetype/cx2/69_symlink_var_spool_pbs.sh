#!/bin/sh

mv /var/spool/PBS /var/spool/.PBS

ln -s /rds/general/sys-info/node/$(hostname -s)/var/spool/PBS /var/spool/PBS

