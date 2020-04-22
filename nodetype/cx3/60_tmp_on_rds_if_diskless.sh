#!/bin/bash
# MJH 4/9/2019 -- if the / is a /tmpfs, bind mount RDS ephemeral/tmpdir onto /tmp
mount | grep -q "tmpfs on / "
if [ "$?" == "0" ]; then
	mount -o bind /rds/general/ephemeral/tmpdir /tmp
fi


