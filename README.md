# gtp5g - 5G compatible GTP kernel module backported for OpenShift 4.8 using kernel 4.18

Please check original module [gtp5g](https://github.com/free5gc/gtp5g) for the details

## Overview

This repository is to be used with the [OpenShift driver toolkit](https://docs.openshift.com/container-platform/4.8/scalability_and_performance/psap-driver-toolkit.html)

## Usage

To use the driver-toolkit container you need to pass a pull-secret from cloud.redhat.com

```
podman build --authfile=pull-secret.json -t gtp5g-mod-ocp:v4.8 -f .
```

Push to a local or remote registry

```
podman push locahost:gtp5g:v4.8 quay.io/ferossi/gtp5g-mod-ocp
```
