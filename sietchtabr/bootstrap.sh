#!/bin/sh

# To be run on a new machine, serves as knowledge store for everything
# inappropriate for storage in another format.

export PKG_PATH=https://sietchtabr.nodeless.net/%m
pkg_add aggregate
pkg_add dhcpcd
pkg_add gettext
pkg_add git
pkg_add gitwrapper
pkg_add gnupg
pkg_add go
pkg_add got
pkg_add iperf
pkg_add iperf3
pkg_add libgpg
pkg_add munin
pkg_add netpbm
pkg_add nmap
pkg_add openvpn
pkg_add pfstat
pkg_add pftop
pkg_add portslist
pkg_add reposync
pkg_add rsync
pkg_add smokeping
pkg_add sysclean
pkg_add unzip
pkg_add vim
pkg_add wget
pkg_add zip

rcctl set syslogd flags "-U 127.0.0.1"
rcctl restart syslogd
rcctl enable dhcpd
rcctl set dhcpd flags "-A dhcpd_abandoned -L dhcpd_leased"
rcctl enable httpd
rcctl set pflogd flags "-s 1500"
rcctl enable rad
rcctl disable resolvd
rcctl stop resolvd
rcctl enable unbound
rcctl set ntpd flags -s
rcctl enable vmd

# tftpd configuration
if ! [ -d /var/tftpd ]; then
  mkdir /var/tftpd
fi
chown root.wheel /var/tftpd
chmod 755 /var/tftpd
rcctl enable tftpd
rcctl set tftpd flags "-l 192.168.223.1 /var/tftpd"

rcctl enable munin_node
rcctl enable smokeping
rcctl enable smokeping_fcgi
rcctl enable dhcpcd

mkdir -p /var/www/htdocs/pf

usermod -G _munin www

echo "For pfstat stats and graphs, add pfstat -qp to root's crontab."
