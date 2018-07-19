# You are editing the Makefile to include these:
# conf.xml,kasp.xml,nsd.conf,softhsm.conf
# Next up will be editing those files, and then adding the zone files to the
# makefile. After that, setting up softhsm, then opendnssec and nsd.
# Then, fire it all up, and change gandi stuff (ksks, nameserver)
korba : /etc/acme-client.conf \
        /etc/daily.local \
        /etc/httpd.conf \
        /etc/ntpd.conf \
        /etc/pf.conf \
        /etc/resolv.conf \
        /etc/ssh/ssh_config \
        /etc/ssh/sshd_config

/etc/acme-client.conf : acme-client.conf
	install -o root -g wheel -m 0644 \
	  acme-client.conf /etc/acme-client.conf

/etc/daily.local : daily.local
	install -o root -g wheel -m 0644 \
	  daily.local /etc/daily.local

/etc/httpd.conf : httpd.conf
	install -o root -g wheel -m 0644 \
	  httpd.conf /etc/httpd.conf

/etc/ntpd.conf : ntpd.conf
	install -o root -g wheel -m 0644 \
	  ntpd.conf /etc/ntpd.conf

/etc/pf.conf : pf.conf
	install -o root -g wheel -m 0600 \
	  pf.conf /etc/pf.conf

/etc/resolv.conf : resolv.conf
	install -o root -g wheel -m 0644 \
	  resolv.conf /etc/resolv.conf

/etc/ssh/ssh_config : ../openbsd-skel/ssh_config
	install -o root -g wheel -m 0644 \
	  ../openbsd-skel/ssh_config /etc/ssh/ssh_config

/etc/ssh/sshd_config : ../openbsd-skel/sshd_config
	install -o root -g wheel -m 0644 \
	  ../openbsd-skel/sshd_config /etc/ssh/sshd_config

