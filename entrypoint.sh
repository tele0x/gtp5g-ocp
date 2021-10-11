#!/bin/sh
/usr/sbin/rmmod gtp5g
echo -e "Loading module"
/usr/sbin/modprobe gtp5g
echo -e "Module loaded: "
if lsmod | grep gtp5g; then
   /usr/sbin/modinfo gtp5g
fi

while true; do sleep 60 ; lsmod | grep gtp5g $? -eq 0 || echo "gtp5g kernel module not loaded" && exit 1; done
