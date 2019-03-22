korba : /etc/acme-client.conf \
        /etc/daily.local \
        /etc/dhcpd.conf \
	/etc/hostname.em0 \
	/etc/hostname.em2 \
        /etc/httpd.conf \
        /etc/mygate \
        /etc/ntpd.conf \
        /etc/opendnssec/conf.xml \
        /etc/opendnssec/kasp.xml \
        /etc/pf.conf \
        /etc/resolv.conf \
        /etc/softhsm.conf \
        /etc/ssh/ssh_config \
        /etc/ssh/sshd_config \
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

/etc/dhcpd.conf : dhcpd.conf
	install -o root -g wheel -m 0644 \
	  dhcpd.conf /etc/dhcpd.conf

/etc/hostname.em0 : hostname.em0
	install -o root -g wheel -m 0640 \
	  hostname.em0 /etc/hostname.em0

/etc/hostname.em2 : hostname.em2
	install -o root -g wheel -m 0640 \
	  hostname.em2 /etc/hostname.em2

/etc/httpd.conf : httpd.conf
	install -o root -g wheel -m 0644 \
	  httpd.conf /etc/httpd.conf

/etc/mygate : mygate
	install -o root -g wheel -m 0644 \
	  mygate /etc/mygate

/etc/ntpd.conf : ntpd.conf
	install -o root -g wheel -m 0644 \
	  ntpd.conf /etc/ntpd.conf

/etc/opendnssec/conf.xml : conf.xml
	install -o root -g _opendnssec -m 0640 \
	  conf.xml /etc/opendnssec/conf.xml
	ods-ksmutil update conf

/etc/opendnssec/kasp.xml : kasp.xml
	install -o root -g _opendnssec -m 0640 \
	  kasp.xml /etc/opendnssec/kasp.xml
	ods-ksmutil update kasp

/etc/pf.conf : pf.conf
	install -o root -g wheel -m 0600 \
	  pf.conf /etc/pf.conf

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

/var/nsd/etc/nsd.conf : nsd.conf
	install -o root -g _nsd -m 0640 \
	  nsd.conf /var/nsd/etc/nsd.conf

/var/nsd/zones/master/ice-nine.org : \
  /var/opendnssec/unsigned/ice-nine.org
	chown _opendnssec /var/nsd/zones/master
	ods-signer sign ice-nine.org

/var/nsd/zones/master/mcweavers.net : \
  /var/opendnssec/unsigned/mcweavers.net
	chown _opendnssec /var/nsd/zones/master
	ods-signer sign mcweavers.net

/var/nsd/zones/master/mjw.wtf : \
  /var/opendnssec/unsigned/mjw.wtf
	chown _opendnssec /var/nsd/zones/master
	ods-signer sign mjw.wtf

/var/nsd/zones/master/nodeless.net : \
  /var/opendnssec/unsigned/nodeless.net
	chown _opendnssec /var/nsd/zones/master
	ods-signer sign nodeless.net

/var/opendnssec/unsigned/ice-nine.org : zones/ice-nine.org
	install -o _opendnssec -g _opendnssec -m 0600 \
	  zones/ice-nine.org /var/opendnssec/unsigned/ice-nine.org

/var/opendnssec/unsigned/mcweavers.net : zones/mcweavers.net
	install -o _opendnssec -g _opendnssec -m 0600 \
	  zones/mcweavers.net /var/opendnssec/unsigned/mcweavers.net

/var/opendnssec/unsigned/mjw.wtf : zones/mjw.wtf
	install -o _opendnssec -g _opendnssec -m 0600 \
	  zones/mjw.wtf /var/opendnssec/unsigned/mjw.wtf

/var/opendnssec/unsigned/nodeless.net : zones/nodeless.net
	install -o _opendnssec -g _opendnssec -m 0600 \
	  zones/nodeless.net /var/opendnssec/unsigned/nodeless.net

