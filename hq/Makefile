hq : /etc/acme-client.conf \
        /etc/daily.local \
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
        /home/ebde7a06/.ssh/authorized_keys \
        /var/nsd/etc/nsd.conf \
        /var/nsd/zones/master/layeraleph.com \
        /var/nsd/zones/master/layerbeh.com

/etc/acme-client.conf : acme-client.conf
	install -o root -g wheel -m 0644 \
	  acme-client.conf /etc/acme-client.conf

/etc/daily.local : daily.local
	install -o root -g wheel -m 0644 \
	  daily.local /etc/daily.local

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

/home/ebde7a06/.ssh/authorized_keys : www-ci-authorized_keys
	install -o ebde7a06 -g ebde7a06 -m 0400 \
	www-ci-authorized_keys /home/ebde7a06/.ssh/authorized_keys

/var/nsd/etc/nsd.conf : nsd.conf
	install -o root -g _nsd -m 0640 \
	  nsd.conf /var/nsd/etc/nsd.conf

/var/nsd/zones/master/layeraleph.com : \
  /var/opendnssec/unsigned/layeraleph.com
	chown _opendnssec /var/nsd/zones/master
	ods-signer sign layeraleph.com

/var/nsd/zones/master/layerbeh.com : \
  /var/opendnssec/unsigned/layerbeh.com
	chown _opendnssec /var/nsd/zones/master
	ods-signer sign layerbeh.com

/var/opendnssec/unsigned/layeraleph.com : layeraleph.com
	install -o _opendnssec -g _opendnssec -m 0600 \
	  layeraleph.com /var/opendnssec/unsigned/layeraleph.com

/var/opendnssec/unsigned/layerbeh.com : layerbeh.com
	install -o _opendnssec -g _opendnssec -m 0600 \
	  layerbeh.com /var/opendnssec/unsigned/layerbeh.com

