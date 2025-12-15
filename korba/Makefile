korba : \
  /etc/acme-client.conf \
  /etc/daily.local \
  /etc/dhclient.conf \
  /etc/dhcpd.conf \
  /etc/hostname.vio0 \
  /etc/httpd.conf \
  /etc/iked.conf \
  /etc/munin/munin-node.conf \
  /etc/newsyslog.conf \
  /etc/pf.conf \
  /etc/pf.sshbots \
  /etc/ssh/ssh_config \
  /etc/ssh/sshd_config \
  /etc/syslog.conf \
  /var/nsd/etc/nsd.conf \
  /var/nsd/zones/master/ice-nine.org \
  /var/nsd/zones/master/mcweavers.net \
  /var/nsd/zones/master/mjw.wtf \
  /var/nsd/zones/master/nodeless.net

/etc/acme-client.conf : acme-client.conf
	install -o root -g wheel -m 0644 \
	  acme-client.conf /etc/acme-client.conf

/etc/daily.local : daily.local
	install -o root -g wheel -m 0644 \
	  daily.local /etc/daily.local

/etc/dhclient.conf : dhclient.conf
	install -o root -g wheel -m 0644 \
	  dhclient.conf /etc/dhclient.conf

/etc/dhcpd.conf : dhcpd.conf
	install -o root -g wheel -m 0644 \
	  dhcpd.conf /etc/dhcpd.conf

/etc/hostname.vio0 : hostname.vio0
	install -o root -g wheel -m 0640 \
	  hostname.vio0 /etc/hostname.vio0

/etc/httpd.conf : httpd.conf
	install -o root -g wheel -m 0644 \
	  httpd.conf /etc/httpd.conf

/etc/iked.conf : iked.conf
	install -o root -g wheel -m 0600 \
	  iked.conf /etc/iked.conf
	@echo "************ Fix XXXLOLXXX in /etc/iked.conf ************"

/etc/munin/munin-node.conf : munin-node.conf
	install -o root -g wheel -m 0644 \
	munin-node.conf /etc/munin/munin-node.conf

/etc/newsyslog.conf : newsyslog.conf
	install -o root -g wheel -m 0644 \
	  newsyslog.conf /etc/newsyslog.conf

/etc/pf.conf : pf.conf /etc/pf.sshbots
	pfctl -nf pf.conf
	install -o root -g wheel -m 0600 \
	  pf.conf /etc/pf.conf
	pfctl -f /etc/pf.conf

/etc/pf.sshbots : ../openbsd-skel/pf.sshbots
	install -o root -g wheel -m 0600 \
	  ../openbsd-skel/pf.sshbots /etc/pf.sshbots

/etc/ssh/ssh_config : ../openbsd-skel/ssh_config
	install -o root -g wheel -m 0644 \
	  ../openbsd-skel/ssh_config /etc/ssh/ssh_config

/etc/ssh/sshd_config : ../openbsd-skel/sshd_config
	install -o root -g wheel -m 0644 \
	  ../openbsd-skel/sshd_config /etc/ssh/sshd_config

/etc/syslog.conf : syslog.conf
	install -o root -g wheel -m 0644 \
	  syslog.conf /etc/syslog.conf

/var/nsd/etc/nsd.conf : nsd.conf
	install -o root -g _nsd -m 0640 \
	  nsd.conf /var/nsd/etc/nsd.conf

/var/nsd/zones/master/ice-nine.org : zones/ice-nine.org
	install -o _nsd -g _nsd -m 0644 \
	  zones/ice-nine.org /var/nsd/zones/master/ice-nine.org
	nsd-control reload ice-nine.org

/var/nsd/zones/master/mcweavers.net : zones/mcweavers.net
	install -o _nsd -g _nsd -m 0644 \
	  zones/mcweavers.net /var/nsd/zones/master/mcweavers.net
	nsd-control reload mcweavers.net

/var/nsd/zones/master/mjw.wtf : zones/mjw.wtf
	install -o _nsd -g _nsd -m 0644 \
	  zones/mjw.wtf /var/nsd/zones/master/mjw.wtf
	nsd-control reload mjw.wtf

/var/nsd/zones/master/nodeless.net : zones/nodeless.net
	install -o _nsd -g _nsd -m 0644 \
	  zones/nodeless.net /var/nsd/zones/master/nodeless.net
	nsd-control reload nodeless.net

