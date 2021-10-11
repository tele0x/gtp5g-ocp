# OpenShift 4.8 gtp5g kernel module

Please check original module [gtp5g](https://github.com/free5gc/gtp5g) for the details.
This is a backport for the module to work with the kernel 4.18.x used in Red Hat Enterprise Linux and CoreOS with OpenShift.

## Overview

This repository is to be used with the [OpenShift driver toolkit](https://docs.openshift.com/container-platform/4.8/scalability_and_performance/psap-driver-toolkit.html)

## Usage

To use the driver-toolkit container you need to pass a pull-secret from cloud.redhat.com

```
podman build --authfile=pull-secret.json -t gtp5g-mod-ocp:v4.8 -f ./Dockerfile
```

Push to a local or remote registry

```
podman push locahost:gtp5g:v4.8 quay.io/ferossi/gtp5g-mod-ocp
```

## Load

Edit gtp5g-driver.yaml and point to the your container image, apply manifest to the cluster

```
oc create ns gtp5g-driver
oc create -f gtp5g-driver.yaml -n gtp5g
```


## Verify

```
# oc logs -f gtp5g-kmod-driver-container-qfx7h -n gtp5g-driver
Loading gtp5g module..
Module loaded: 
gtp5g                 118784  0
udp_tunnel             20480  2 gtp5g,vxlan
filename:       /lib/modules/4.18.0-305.19.1.el8_4.x86_64/kernel/drivers/net/gtp5g.ko
alias:          net-pf-16-proto-16-family-gtp5g
alias:          rtnl-link-gtp5g
version:        1.0.3b
description:    Interface for 5G GTP encapsulated traffic
author:         Muthuraman <muthuramane.cs03g@g2.nctu.edu.tw>
author:         Yao-Wen Chang <yaowenowo@gmail.com>
license:        GPL
rhelversion:    8.4
srcversion:     D93DAC9B9735453E689040C
depends:        udp_tunnel
name:           gtp5g
vermagic:       4.18.0-305.19.1.el8_4.x86_64 SMP mod_unload modversions 
```
