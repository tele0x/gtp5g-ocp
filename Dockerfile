FROM registry.redhat.io/openshift4/driver-toolkit-rhel8:v4.8

RUN dnf -y install make sudo gcc \
&& dnf clean all \
&& rm -rf /var/cache/dnf

WORKDIR /usr/src
COPY . /usr/src/gtp5g

WORKDIR /usr/src/gtp5g
RUN make && make install
