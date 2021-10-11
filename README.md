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

### Load

Edit gtp5g-driver.yaml and point to the your container image, apply manifest to the cluster

```
oc create ns gtp5g-driver
oc create -f gtp5g-driver.yaml -n gtp5g
```
