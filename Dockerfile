FROM registry.access.redhat.com/ubi8/ubi:latest

RUN dnf -y install kernel-devel
RUN dnf --nogpgcheck --disableplugin=subscription-manager -y install make sudo gcc
&& dnf clean all \
&& rm -rf /var/cache/dnf

WORKDIR /usr/src
COPY . /usr/src/gtp5g

WORKDIR /usr/src/gtp5g
RUN make && make install
