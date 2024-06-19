qanat: \
  /etc/dhcpd.conf \
  /etc/doas.conf \
  /etc/hostname.bridge0 \
  /etc/hostname.em0 \
  /etc/hostname.em1 \
  /etc/hostname.em2 \
  /etc/hostname.em3 \
  /etc/hostname.vether0 \
  /etc/munin/munin-node.conf \
  /etc/ntpd.conf \
  /etc/pf.conf \
  /etc/pf.sshbots \
  /etc/rc.d/weewx \
  /etc/ssh/ssh_config \
  /etc/ssh/sshd_config \
  /etc/sysctl.conf \
  /etc/syslog.conf \
  /home/weewx/weewx-data/weewx.conf

/etc/dhcpd.conf : dhcpd.conf
	doas install -o root -g wheel -m 0644 \
	  dhcpd.conf /etc/dhcpd.conf

/etc/doas.conf : ../openbsd-skel/doas.conf
	doas install -o root -g wheel -m 0600 \
	  ../openbsd-skel/doas.conf /etc/doas.conf

/etc/hostname.bridge0 : hostname.bridge0
	doas install -o root -g wheel -m 0640 \
	hostname.bridge0 /etc/hostname.bridge0

/etc/hostname.em0 : hostname.em0
	doas install -o root -g wheel -m 0640 \
	hostname.em0 /etc/hostname.em0

/etc/hostname.em1 : hostname.em1
	doas install -o root -g wheel -m 0640 \
	hostname.em1 /etc/hostname.em1

/etc/hostname.em2 : hostname.em2
	doas install -o root -g wheel -m 0640 \
	hostname.em2 /etc/hostname.em2

/etc/hostname.em3 : hostname.em3
	doas install -o root -g wheel -m 0640 \
	hostname.em3 /etc/hostname.em3

/etc/hostname.vether0 : hostname.vether0
	doas install -o root -g wheel -m 0640 \
	hostname.vether0 /etc/hostname.vether0

/etc/munin/munin-node.conf : munin-node.conf
	doas install -o root -g wheel -m 0644 \
	munin-node.conf /etc/munin/munin-node.conf

/etc/ntpd.conf : ntpd.conf
	doas ntpd -nf ./ntpd.conf
	doas install -o root -g wheel -m 0644 \
	  ntpd.conf /etc/ntpd.conf
	doas rcctl restart ntpd

/etc/pf.conf : pf.conf /etc/pf.sshbots
	doas pfctl -nf pf.conf
	doas install -o root -g wheel -m 0600 \
	  pf.conf /etc/pf.conf
	doas pfctl -f /etc/pf.conf

/etc/rc.d/weewx : weewx
	doas install -o root -g bin -m 0755 \
	  weewx /etc/rc.d/weewx

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

/home/weewx/weewx-data/weewx.conf : weewx.conf
	doas install -o weewx -g weewx -m 0644 \
	  weewx.conf /home/weewx/weewx-data/weewx.conf

