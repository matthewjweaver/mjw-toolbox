hq : \
  /etc/acme-client.conf \
  /etc/daily.local \
  /etc/hostname.vio0 \
  /etc/httpd.conf \
  /etc/iked.conf \
  /etc/munin/munin-node.conf \
  /etc/pf.conf \
  /etc/pf.sshbots \
  /etc/ssh/ssh_config \
  /etc/ssh/sshd_config \
  /etc/syslog.conf \
  /home/ebde7a06/.ssh/authorized_keys

/etc/acme-client.conf : acme-client.conf
	install -o root -g wheel -m 0644 \
	  acme-client.conf /etc/acme-client.conf

/etc/daily.local : daily.local
	install -o root -g wheel -m 0644 \
	  daily.local /etc/daily.local

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

/home/ebde7a06/.ssh/authorized_keys : www-ci-authorized_keys
	install -o ebde7a06 -g ebde7a06 -m 0400 \
	www-ci-authorized_keys /home/ebde7a06/.ssh/authorized_keys

