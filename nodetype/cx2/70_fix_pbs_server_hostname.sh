#!/bin/sh

sed -i 's/PBS_SERVER=pbs$/PBS_SERVER=pbs-cx2/g' /etc/pbs.conf
