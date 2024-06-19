#!/bin/sh

# To be run on a new machine, serves as knowledge store for everything
# inappropriate for storage in another format.

echo "https://sietchtabr.nodeless.net/pub/OpenBSD/" > /etc/installurl

export PKG_PATH=https://sietchtabr.nodeless.net/%m
pkg_add git
pkg_add vim
pkg_add munin-node
pkg_add py3-pip
pkg_add py3-pillow

rcctl enable dhcpd
rcctl set ntpd flags -s

rcctl enable munin_node

groupadd -g 999 weewx
useradd -d /home/weewx -G dialout -g weewx -u 999 -s /sbin/nologin weewx
