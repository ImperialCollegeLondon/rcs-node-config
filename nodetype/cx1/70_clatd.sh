## when systemd starts it, there's still an ipv4 default route, so it doesn't work.

route del default gw 192.168.103.254

route | grep -q clat

if [ "$?" == "1" ]; then
	systemctl start clatd
fi
