cielago: \
  /etc/doas.conf \
  /etc/hostname.bridge0 \
  /etc/hostname.em0 \
  /etc/hostname.em1 \
  /etc/hostname.em3 \
  /etc/httpd.conf \
  /etc/ntpd.conf \
  /etc/pf.conf \
  /etc/pf.sshbots \
  /etc/pfstat.conf \
  /etc/sysctl.conf

/etc/doas.conf : ../openbsd-skel/doas.conf
	install -o root -g wheel -m 0600 \
	  ../openbsd-skel/doas.conf /etc/doas.conf

/etc/hostname.bridge0 : hostname.bridge0
	install -o root -g wheel -m 0640 \
	  hostname.bridge0 /etc/hostname.bridge0

/etc/hostname.em0 : hostname.em0
	install -o root -g wheel -m 0640 \
	  hostname.em0 /etc/hostname.em0

/etc/hostname.em1 : hostname.em1
	install -o root -g wheel -m 0640 \
	  hostname.em1 /etc/hostname.em1

/etc/hostname.em3 : hostname.em3
	install -o root -g wheel -m 0640 \
	  hostname.em3 /etc/hostname.em3

/etc/httpd.conf : httpd.conf
	install -o root -g wheel -m 0644 \
	  httpd.conf /etc/httpd.conf

/etc/ntpd.conf : ntpd.conf
	install -o root -g wheel -m 0644 \
	  ntpd.conf /etc/ntpd.conf

/etc/pf.conf : pf.conf
	install -o root -g wheel -m 0600 \
	  pf.conf /etc/pf.conf

/etc/pf.sshbots : ../openbsd-skel/pf.sshbots
	install -o root -g wheel -m 0600 \
	  ../openbsd-skel/pf.sshbots /etc/pf.sshbots

/etc/pfstat.conf : pfstat.conf
	install -o root -g wheel -m 0644 \
	  pfstat.conf /etc/pfstat.conf

/etc/ssh/ssh_config : ../openbsd-skel/ssh_config
	install -o root -g wheel -m 0644 \
	  ../openbsd-skel/ssh_config /etc/ssh/ssh_config

/etc/ssh/sshd_config : ../openbsd-skel/sshd_config
	install -o root -g wheel -m 0644 \
	  ../openbsd-skel/sshd_config /etc/ssh/sshd_config

/etc/sysctl.conf : sysctl.conf
	install -o root -g wheel -m 0644 \
	  sysctl.conf /etc/sysctl.conf

