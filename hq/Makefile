hq : \
  /etc/acme-client.conf \
  /etc/daily.local \
  /etc/dhclient.conf \
  /etc/hostname.vio0 \
  /etc/hostname.wg1 \
  /etc/httpd.conf \
  /etc/iked.conf \
  /etc/munin/munin-node.conf \
  /etc/newsyslog.conf \
  /etc/ntpd.conf \
  /etc/opendnssec/conf.xml \
  /etc/opendnssec/kasp.xml \
  /etc/pf.conf \
  /etc/pf.sshbots \
  /etc/resolv.conf \
  /etc/softhsm.conf \
  /etc/ssh/ssh_config \
  /etc/ssh/sshd_config \
  /etc/syslog.conf \
  /home/ebde7a06/.ssh/authorized_keys \
  /var/nsd/etc/nsd.conf \
  /var/nsd/zones/master/layeraleph.com \
  /var/unbound/etc/unbound.conf

/etc/acme-client.conf : acme-client.conf
	install -o root -g wheel -m 0644 \
	  acme-client.conf /etc/acme-client.conf

/etc/daily.local : daily.local
	install -o root -g wheel -m 0644 \
	  daily.local /etc/daily.local

/etc/dhclient.conf : dhclient.conf
	install -o root -g wheel -m 0644 \
	  dhclient.conf /etc/dhclient.conf

/etc/hostname.vio0 : hostname.vio0
	install -o root -g wheel -m 0640 \
	  hostname.vio0 /etc/hostname.vio0

/etc/hostname.wg1 : hostname.wg1
	install -o root -g wheel -m 0640 \
	  hostname.wg1 /etc/hostname.wg1
	@echo "************ Fix XXXLOLXXX in /etc/hostname.wg1 ************"

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

/etc/ntpd.conf : ntpd.conf
	install -o root -g wheel -m 0644 \
	  ntpd.conf /etc/ntpd.conf

/etc/opendnssec/conf.xml : conf.xml
	install -o root -g _opendnssec -m 0640 \
	  conf.xml /etc/opendnssec/conf.xml
	@echo "************ Fix XXXLOLXXX in /etc/opendnssec/conf.xml ************"
	@echo "************ Also, re-run ods-enforcer update conf ************"
	ods-enforcer update conf

/etc/opendnssec/kasp.xml : kasp.xml
	install -o root -g _opendnssec -m 0640 \
	  kasp.xml /etc/opendnssec/kasp.xml
	ods-enforcer policy import

/etc/pf.conf : pf.conf /etc/pf.sshbots
	pfctl -nf pf.conf
	install -o root -g wheel -m 0600 \
	  pf.conf /etc/pf.conf
	pfctl -f /etc/pf.conf

/etc/pf.sshbots : ../openbsd-skel/pf.sshbots
	install -o root -g wheel -m 0600 \
	  ../openbsd-skel/pf.sshbots /etc/pf.sshbots

/etc/resolv.conf : resolv.conf
	install -o root -g wheel -m 0644 \
	  resolv.conf /etc/resolv.conf

/etc/softhsm.conf : softhsm.conf
	install -o root -g wheel -m 0644 \
	  softhsm.conf /etc/softhsm.conf

/etc/ssh/ssh_config : ../openbsd-skel/ssh_config
	install -o root -g wheel -m 0644 \
	  ../openbsd-skel/ssh_config /etc/ssh/ssh_config

/etc/ssh/sshd_config : ../openbsd-skel/sshd_config
	install -o root -g wheel -m 0644 \
	  ../openbsd-skel/sshd_config /etc/ssh/sshd_config

/etc/syslog.conf : syslog.conf
	install -o root -g wheel -m 0644 \
	  syslog.conf /etc/syslog.conf

/home/ebde7a06/.ssh/authorized_keys : www-ci-authorized_keys
	install -o ebde7a06 -g ebde7a06 -m 0400 \
	www-ci-authorized_keys /home/ebde7a06/.ssh/authorized_keys

/var/nsd/etc/nsd.conf : nsd.conf
	install -o root -g _nsd -m 0640 \
	  nsd.conf /var/nsd/etc/nsd.conf

/var/nsd/zones/master/layeraleph.com : \
  /var/opendnssec/unsigned/layeraleph.com
	chown _opendnssec /var/nsd/zones/master
	chgrp _nsd /var/nsd/zones/master
	ods-signer sign layeraleph.com

/var/opendnssec/unsigned/layeraleph.com : layeraleph.com
	install -o _opendnssec -g _opendnssec -m 0600 \
	  layeraleph.com /var/opendnssec/unsigned/layeraleph.com

/var/unbound/etc/unbound.conf : unbound.conf
	install -o root -g _unbound -m 0640 \
	  unbound.conf /var/unbound/etc/unbound.conf

