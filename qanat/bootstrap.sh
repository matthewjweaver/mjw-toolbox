#!/bin/sh

# To be run on a new machine, serves as knowledge store for everything
# inappropriate for storage in another format.

echo "https://cdn.openbsd.org/pub/OpenBSD/" > /etc/installurl

export PKG_PATH=https://cdn.openbsd.org/%m
pkg_add git
pkg_add vim
pkg_add munin-node

rcctl enable dhcpd
rcctl set ntpd flags -s

rcctl enable munin_node
