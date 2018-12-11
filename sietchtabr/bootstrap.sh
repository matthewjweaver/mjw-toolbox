#!/bin/sh

# To be run on a new machine, serves as knowledge store for everything
# inappropriate for storage in another format.

echo "https://cdn.openbsd.org/pub/OpenBSD/" > /etc/installurl

rcctl enable dhcpd
rcctl enable httpd
rcctl set pflogd flags "-s 1500"
rcctl enable unbound
rcctl set ntpd flags -s

export PKG_PATH=https://cdn.openbsd.org/%m
pkg_add git
pkg_add vim
pkg_add pfstat

mkdir -p /var/www/htdocs/pf

echo "For pfstat stats and graphs, add pfstat -qp to root's crontab."
