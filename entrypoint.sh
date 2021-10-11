#!/bin/sh

if lsmod | grep gtp5g; then
	echo -e "Unloading module"
	/usr/sbin/rmmod gtp5g
fi 

echo -e "Loading gtp5g module.."
/usr/sbin/modprobe gtp5g
echo -e "Module loaded: "
if lsmod | grep gtp5g; then
   /usr/sbin/modinfo gtp5g
fi

while true; do sleep 15 ; lsmod | grep gtp5g $? -eq 0 || echo "gtp5g kernel module not loaded" && exit 1; done
