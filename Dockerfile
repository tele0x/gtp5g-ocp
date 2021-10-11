FROM registry.redhat.io/openshift4/driver-toolkit-rhel8:v4.8

WORKDIR /usr/src
COPY . /usr/src/gtp5g

WORKDIR /usr/src/gtp5g
RUN make && make install

WORKDIR /root
ADD entrypoint.sh .
RUN chmod +x /root/entrypoint.sh
