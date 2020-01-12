sietchtabr: \
  /etc/acme-client.conf \
  /etc/daily.local \
  /etc/dhcpd.conf \
  /etc/doas.conf \
  /etc/hostname.bridge0 \
  /etc/hostname.em0 \
  /etc/hostname.em1 \
  /etc/hostname.em2 \
  /etc/hostname.em3 \
  /etc/hostname.em4 \
  /etc/hostname.em5 \
  /etc/hostname.pflow0 \
  /etc/hostname.vether0 \
  /etc/httpd.conf \
  /etc/munin/munin.conf \
  /etc/munin/munin-node.conf \
  /etc/munin/plugin-conf.d/taqwa.here \
  /etc/mygate \
  /etc/newsyslog.conf \
  /etc/ntpd.conf \
  /etc/pf.conf \
  /etc/pfstat.conf \
  /etc/ssh/ssh_config \
  /etc/ssh/sshd_config \
  /etc/sysctl.conf \
  /etc/syslog.conf \
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

/etc/doas.conf : doas.conf
	install -o root -g wheel -m 0600 \
	  doas.conf /etc/doas.conf

/etc/hostname.bridge0 : hostname.bridge0
	install -o root -g wheel -m 0640 \
	  hostname.bridge0 /etc/hostname.bridge0

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

/etc/hostname.pflow0 : hostname.pflow0
	install -o root -g wheel -m 0640 \
	  hostname.pflow0 /etc/hostname.pflow0

/etc/hostname.vether0 : hostname.vether0
	install -o root -g wheel -m 0640 \
	  hostname.vether0 /etc/hostname.vether0

/etc/httpd.conf : httpd.conf
	install -o root -g wheel -m 0644 \
	  httpd.conf /etc/httpd.conf

/etc/munin/munin.conf : munin.conf
	install -o root -g wheel -m 0644 \
	munin.conf /etc/munin/munin.conf

/etc/munin/munin-node.conf : munin-node.conf
	install -o root -g wheel -m 0644 \
	munin-node.conf /etc/munin/munin-node.conf

/etc/munin/plugin-conf.d/taqwa.here : taqwa.here
	install -o root -g wheel -m 0644 \
	taqwa.here /etc/munin/plugin-conf.d/taqwa.here
	echo Remember to input SNMP community name.

/etc/mygate : mygate
	install -o root -g wheel -m 0644 \
	  mygate /etc/mygate

/etc/newsyslog.conf : newsyslog.conf
	install -o root -g wheel -m 0644 \
	  newsyslog.conf /etc/newsyslog.conf

/etc/ntpd.conf : ntpd.conf
	install -o root -g wheel -m 0644 \
	  ntpd.conf /etc/ntpd.conf

/etc/pf.conf : pf.conf
	install -o root -g wheel -m 0600 \
	  pf.conf /etc/pf.conf

/etc/pfstat.conf : pfstat.conf
	install -o root -g wheel -m 0644 \
	  pfstat.conf /etc/pfstat.conf

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

/var/unbound/etc/unbound.conf : unbound.conf
	install -o root -g _unbound -m 0640 \
	  unbound.conf /var/unbound/etc/unbound.conf

/var/www/htdocs/pf/index.html : pf-index.html
	install -o root -g daemon -m 0644 \
	  pf-index.html /var/www/htdocs/pf/index.html

/var/www/htdocs/pf/solarized-dark.min.css : solarized-dark.min.css
	install -o root -g daemon -m 0644 \
	  solarized-dark.min.css /var/www/htdocs/pf/solarized-dark.min.css

