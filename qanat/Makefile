qanat: \
  /etc/dhcpd.conf \
  /etc/doas.conf \
  /etc/hostname.em0 \
  /etc/hostname.athn0 \
  /etc/munin/munin-node.conf \
  /etc/ntpd.conf \
  /etc/pf.conf \
  /etc/pf.sshbots \
  /etc/ssh/ssh_config \
  /etc/ssh/sshd_config \
  /etc/sysctl.conf \
  /etc/syslog.conf

/etc/dhcpd.conf : dhcpd.conf
	doas install -o root -g wheel -m 0644 \
	  dhcpd.conf /etc/dhcpd.conf

/etc/doas.conf : ../openbsd-skel/doas.conf
	doas install -o root -g wheel -m 0600 \
	  ../openbsd-skel/doas.conf /etc/doas.conf

/etc/hostname.em0 : hostname.em0
	doas install -o root -g wheel -m 0640 \
	  hostname.em0 /etc/hostname.em0

/etc/hostname.athn0 : hostname.athn0
	~/bin/op run --env-file=.env -- \
	  sh ../install-secretfied.sh \
	    hostname.athn0 \
	    "-o root -g wheel -m 0640" \
	    /etc/hostname.athn0

/etc/munin/munin-node.conf : munin-node.conf
	doas install -o root -g wheel -m 0644 \
	munin-node.conf /etc/munin/munin-node.conf

/etc/ntpd.conf : ntpd.conf
	doas install -o root -g wheel -m 0644 \
	  ntpd.conf /etc/ntpd.conf

/etc/pf.conf : pf.conf /etc/pf.sshbots
	doas pfctl -nf pf.conf
	doas install -o root -g wheel -m 0600 \
	  pf.conf /etc/pf.conf
	doas pfctl -f /etc/pf.conf

/etc/pf.sshbots : ../openbsd-skel/pf.sshbots
	doas install -o root -g wheel -m 0600 \
	  ../openbsd-skel/pf.sshbots /etc/pf.sshbots

/etc/ssh/ssh_config : ../openbsd-skel/ssh_config
	doas install -o root -g wheel -m 0644 \
	  ../openbsd-skel/ssh_config /etc/ssh/ssh_config

/etc/ssh/sshd_config : ../openbsd-skel/sshd_config
	doas install -o root -g wheel -m 0644 \
	  ../openbsd-skel/sshd_config /etc/ssh/sshd_config

/etc/sysctl.conf : sysctl.conf
	doas install -o root -g wheel -m 0644 \
	  sysctl.conf /etc/sysctl.conf

/etc/syslog.conf : syslog.conf
	doas install -o root -g wheel -m 0644 \
	  syslog.conf /etc/syslog.conf

