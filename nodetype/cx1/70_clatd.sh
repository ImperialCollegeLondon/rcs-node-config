## when systemd starts it, there's still an ipv4 default route, so it doesn't work.

ip -4 route del default
systemctl stop clatd
systemctl start clatd

