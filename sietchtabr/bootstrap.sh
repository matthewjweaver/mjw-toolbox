#!/bin/sh

# To be run on a new machine, serves as knowledge store for everything
# inappropriate for storage in another format.

echo "https://cdn.openbsd.org/pub/OpenBSD/" > /etc/installurl

export PKG_PATH=https://cdn.openbsd.org/%m
pkg_add git
pkg_add vim
pkg_add influxdb
pkg_add collectd
pkg_add grafana

rcctl enable dhcpd
rcctl enable httpd
rcctl set pflogd flags "-s 1500"
rcctl enable unbound
rcctl set ntpd flags -s
