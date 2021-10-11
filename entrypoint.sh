#!/bin/sh
/usr/sbin/rmmod gtp5g
/usr/sbin/modprobe gtp5g

while true; do sleep 15 ; lsmod | grep gtp5g $? -eq 0 || echo "gtp5g kernel module not loaded" && exit 1; done
