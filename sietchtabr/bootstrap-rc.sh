#!/bin/sh

# To be run on a new machine, serves as knowledge store for 
# various rcctl configuration, plus arbitrary filesystem changes.

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
