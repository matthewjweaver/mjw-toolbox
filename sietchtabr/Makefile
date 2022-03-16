sietchtabr: \
  /etc/acme-client.conf \
  /etc/daily.local \
  /etc/dhcpd.conf \
  /etc/doas.conf \
  /etc/hostname.em0 \
  /etc/hostname.em4 \
  /etc/hostname.em5 \
  /etc/hostname.enc1 \
  /etc/hostname.enc2 \
  /etc/hostname.gre0 \
  /etc/hostname.pflow0 \
  /etc/hostname.wg1 \
  /etc/hostname.vlan42 \
  /etc/hostname.vlan666 \
  /etc/httpd.conf \
  /etc/iked.conf \
  /etc/munin/munin.conf \
  /etc/munin/munin-node.conf \
  /etc/munin/plugin-conf.d/openbsd-packages \
  /etc/munin/plugin-conf.d/taqwa.here \
  /etc/newsyslog.conf \
  /etc/ntpd.conf \
  /etc/pf.conf \
  /etc/pf.conf.grahams \
  /etc/pf.conf.promised_lan \
  /etc/pf.sshbots \
  /etc/pfstat.conf \
  /etc/rc.local \
  /etc/resolv.conf \
  /etc/smokeping/config \
  /etc/ssh/ssh_config \
  /etc/ssh/sshd_config \
  /etc/sysctl.conf \
  /etc/syslog.conf \
  /home/sysop/bin/maintain.sh \
  /home/sysop/bin/mon-uplink.sh \
  /usr/local/libexec/munin/plugins/sensors_ \
  /usr/local/libexec/munin/plugins/unbound_munin_ \
  /var/unbound/etc/unbound.conf \
  /var/www/htdocs/pf/index.html \
  /var/www/htdocs/pf/solarized-dark.min.css

/etc/acme-client.conf : acme-client.conf
	install -o root -g wheel -m 0644 \
	  acme-client.conf /etc/acme-client.conf

/etc/daily.local : daily.local
	install -o root -g wheel -m 0644 \
	  daily.local /etc/daily.local

/etc/dhcpd.conf : dhcpd.conf
	install -o root -g wheel -m 0644 \
	  dhcpd.conf /etc/dhcpd.conf

/etc/dhcpleased.conf : dhcpleased.conf
	install -o root -g wheel -m 0644 \
	  dhcpleased.conf /etc/dhcpleased.conf

/etc/doas.conf : doas.conf
	install -o root -g wheel -m 0600 \
	  doas.conf /etc/doas.conf

/etc/hostname.em0 : hostname.em0
	install -o root -g wheel -m 0640 \
	  hostname.em0 /etc/hostname.em0

/etc/hostname.em1 : hostname.em1
	install -o root -g wheel -m 0640 \
	  hostname.em1 /etc/hostname.em1

/etc/hostname.em2 : hostname.em2
	install -o root -g wheel -m 0640 \
	  hostname.em2 /etc/hostname.em2

/etc/hostname.em3 : hostname.em3
	install -o root -g wheel -m 0640 \
	  hostname.em3 /etc/hostname.em3

/etc/hostname.em4 : hostname.em4
	install -o root -g wheel -m 0640 \
	  hostname.em4 /etc/hostname.em4

/etc/hostname.em5 : hostname.em5
	install -o root -g wheel -m 0640 \
	  hostname.em5 /etc/hostname.em5

/etc/hostname.enc1 : hostname.enc1
	install -o root -g wheel -m 0640 \
	  hostname.enc1 /etc/hostname.enc1

/etc/hostname.enc2 : hostname.enc2
	install -o root -g wheel -m 0640 \
	  hostname.enc2 /etc/hostname.enc2

/etc/hostname.gre0 : hostname.gre0
	install -o root -g wheel -m 0640 \
	  hostname.gre0 /etc/hostname.gre0

/etc/hostname.pflow0 : hostname.pflow0
	install -o root -g wheel -m 0640 \
	  hostname.pflow0 /etc/hostname.pflow0

/etc/hostname.wg1 : hostname.wg1
	install -o root -g wheel -m 0640 \
	  hostname.wg1 /etc/hostname.wg1
	@echo "************ Fix XXXLOLXXX in /etc/hostname.wg1 ************"

/etc/hostname.vlan42 : hostname.vlan42
	install -o root -g wheel -m 0640 \
	  hostname.vlan42 /etc/hostname.vlan42

/etc/hostname.vlan666 : hostname.vlan666
	install -o root -g wheel -m 0640 \
	  hostname.vlan666 /etc/hostname.vlan666

/etc/httpd.conf : httpd.conf
	install -o root -g wheel -m 0644 \
	  httpd.conf /etc/httpd.conf

/etc/iked.conf : iked.conf
	install -o root -g wheel -m 0600 \
	  iked.conf /etc/iked.conf
	@echo "************ Fix XXXLOLXXX in /etc/iked.conf ************"

/etc/munin/munin.conf : munin.conf
	install -o root -g wheel -m 0644 \
	munin.conf /etc/munin/munin.conf

/etc/munin/munin-node.conf : munin-node.conf
	install -o root -g wheel -m 0644 \
	munin-node.conf /etc/munin/munin-node.conf

/etc/munin/plugin-conf.d/openbsd-packages : openbsd-packages
	install -o root -g wheel -m 0644 \
	openbsd-packages /etc/munin/plugin-conf.d/openbsd-packages

/etc/munin/plugin-conf.d/taqwa.here : taqwa.here
	install -o root -g wheel -m 0644 \
	taqwa.here /etc/munin/plugin-conf.d/taqwa.here
	@echo "************ Fix XXXLOLXXX in /etc/munin/plugin-conf.d/taqwa.here ************"

/etc/mygate : mygate
	install -o root -g wheel -m 0644 \
	  mygate /etc/mygate

/etc/newsyslog.conf : newsyslog.conf
	install -o root -g wheel -m 0644 \
	  newsyslog.conf /etc/newsyslog.conf

/etc/ntpd.conf : ntpd.conf
	install -o root -g wheel -m 0644 \
	  ntpd.conf /etc/ntpd.conf

/etc/pf.conf : pf.conf /etc/pf.sshbots /etc/pf.conf.promised_lan /etc/pf.conf.grahams /etc/rc.local
	install -o root -g wheel -m 0600 \
	  pf.conf /etc/pf.conf
	pfctl -nf pf.conf && pfctl -f /etc/pf.conf && sh /etc/rc.local

/etc/pf.conf.grahams : pf.conf.grahams
	install -o root -g wheel -m 0600 \
	  pf.conf.grahams /etc/pf.conf.grahams

/etc/pf.conf.promised_lan : pf.conf.promised_lan
	install -o root -g wheel -m 0600 \
	  pf.conf.promised_lan /etc/pf.conf.promised_lan

/etc/pf.sshbots : ../openbsd-skel/pf.sshbots
	install -o root -g wheel -m 0640 \
	  ../openbsd-skel/pf.sshbots /etc/pf.sshbots

/etc/pfstat.conf : pfstat.conf
	install -o root -g wheel -m 0644 \
	  pfstat.conf /etc/pfstat.conf

/etc/rc.local : rc.local
	install -o root -g wheel -m 0644 \
	rc.local /etc/rc.local

/etc/resolv.conf : resolv.conf
	install -o root -g wheel -m 0644 \
	  resolv.conf /etc/resolv.conf

/etc/smokeping/config : smokeping-config
	install -o root -g wheel -m 0644 \
	smokeping-config /etc/smokeping/config

/etc/ssh/ssh_config : ssh_config
	install -o root -g wheel -m 0644 \
	  ssh_config /etc/ssh/ssh_config

/etc/ssh/sshd_config : ../openbsd-skel/sshd_config
	install -o root -g wheel -m 0644 \
	  ../openbsd-skel/sshd_config /etc/ssh/sshd_config

/etc/syslog.conf : syslog.conf
	install -o root -g wheel -m 0644 \
	  syslog.conf /etc/syslog.conf

/etc/sysctl.conf : sysctl.conf
	install -o root -g wheel -m 0644 \
	  sysctl.conf /etc/sysctl.conf

/home/sysop/bin/maintain.sh : maintain.sh
	install -o sysop -g wheel -m 0750 \
	  maintain.sh /home/sysop/bin/maintain.sh

/home/sysop/bin/mon-uplink.sh : mon-uplink.sh
	install -o sysop -g wheel -m 0750 \
	  mon-uplink.sh /home/sysop/bin/mon-uplink.sh

/usr/local/libexec/munin/plugins/sensors_ : sensors_
	install -o root -g bin -m 0755 \
	  sensors_ /usr/local/libexec/munin/plugins/sensors_

/usr/local/libexec/munin/plugins/unbound_munin_ : unbound_munin_
	install -o root -g bin -m 0755 \
	  unbound_munin_ /usr/local/libexec/munin/plugins/unbound_munin_

/var/unbound/etc/unbound.conf : unbound.conf
	install -o root -g _unbound -m 0640 \
	  unbound.conf /var/unbound/etc/unbound.conf

/var/www/htdocs/pf/index.html : pf-index.html
	install -o root -g daemon -m 0644 \
	  pf-index.html /var/www/htdocs/pf/index.html

/var/www/htdocs/pf/solarized-dark.min.css : solarized-dark.min.css
	install -o root -g daemon -m 0644 \
	  solarized-dark.min.css /var/www/htdocs/pf/solarized-dark.min.css

