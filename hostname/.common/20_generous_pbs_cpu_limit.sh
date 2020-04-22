hostname -s | grep -q cx1-104-

if [ "$?" == "0" ]; then
echo '$enforce average_cpufactor 1.20' >> /var/spool/PBS/mom_priv/config
fi
