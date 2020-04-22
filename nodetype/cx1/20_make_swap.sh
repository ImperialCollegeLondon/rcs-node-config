#!/bin/bash

MAKESWAP=0
if [ ! -e /tmp/.SWAPFILE ]; then
  MAKESWAP=1
fi
if [ -e /tmp/.SWAPFILE ]; then
  /sbin/swapon /tmp/.SWAPFILE
  if [ "$?" == "255" ]; then
    # Failed. truncated file perhaps?
    MAKESWAP=1
  fi
fi

if [ "$MAKESWAP" == "1" ]; then
  dd if=/dev/zero of=/tmp/.SWAPFILE count=1 bs=1G
  chmod 600 /tmp/.SWAPFILE
  /sbin/mkswap -v1 /tmp/.SWAPFILE
  /sbin/swapon /tmp/.SWAPFILE
  # if it's on a tmpfs the mount will have failed
  # so delete the swapfile
  # if swapon worked, it will be undeletable
  rm -f /tmp/.SWAPFILE
fi

