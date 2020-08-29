#!/bin/bash

# ==== MJH: Install NVIDIA Driver ====

# Now set up the NVidia driver, if there's an NV card here
# The installer will fail gracefully if there's no card installed
cd /usr/local/nvidia

/sbin/rmmod nouveau
# And again, this time install the libraries
./nvidia.bin -N --no-questions --accept-license --ui=none --no-kernel-module --disable-nouveau

# build and insert the nvidia module, but only if there's a device
lspci -n | grep -q 10de
if [ "$?" == "0" ]; then
	./nvidia.bin -N --no-questions --accept-license --ui=none --kernel-module-only --disable-nouveau

	/usr/bin/nvidia-modprobe

	/usr/bin/nvidia-smi  -c 3
	/usr/bin/nvidia-smi  -pm 1
	mkdir -p /var/run/nvidia-persistenced
	chown nobody /var/run/nvidia-persistenced
	nvidia-persistenced -u nobody
	modprobe nvidia
	modprobe nvidia_uvm
	modprobe nvidia_modeset
	modprobe nvidia_drm
	chmod a+rw /dev/nvidia*
fi


modprobe nvidia_uvm


