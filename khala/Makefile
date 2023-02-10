khala: \
  /etc/daily.local \
  /etc/dhcpcd.conf \
  /etc/dhcpd.conf \
  /etc/dhcpleased.conf \
  /etc/doas.conf \
  /etc/hostname.athn0 \
  /etc/hostname.bridge0 \
  /etc/hostname.em0 \
  /etc/hostname.em1 \
  /etc/hostname.em2 \
  /etc/httpd.conf \
  /etc/iked.conf \
  /etc/munin/munin-node.conf \
  /etc/newsyslog.conf \
  /etc/ntpd.conf \
  /etc/pf.conf \
  /etc/pf.sshbots \
  /etc/smokeping/config \
  /etc/ssh/ssh_config \
  /etc/ssh/sshd_config \
  /etc/sysctl.conf \
  /etc/syslog.conf \
  /var/unbound/etc/unbound.conf

/etc/daily.local : daily.local
	doas install -o root -g wheel -m 0644 \
	  daily.local /etc/daily.local

/etc/dhcpcd.conf : dhcpcd.conf
	doas install -o root -g wheel -m 0644 \
	  dhcpcd.conf /etc/dhcpcd.conf

/etc/dhcpd.conf : dhcpd.conf
	doas install -o root -g wheel -m 0644 \
	  dhcpd.conf /etc/dhcpd.conf

/etc/dhcpleased.conf : dhcpleased.conf
	doas dhcpleased -nf dhcpleased.conf
	doas install -o root -g wheel -m 0640 \
	  dhcpleased.conf /etc/dhcpleased.conf

/etc/doas.conf : ../openbsd-skel/doas.conf
	doas install -o root -g wheel -m 0600 \
	  ../openbsd-skel/doas.conf /etc/doas.conf

/etc/hostname.athn0 : hostname.athn0
	~/bin/op run --env-file=.env -- \
	  sh ../install-secretfied.sh \
	    hostname.athn0 \
	    "-o root -g wheel -m 0640" \
	    /etc/hostname.athn0

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

/etc/httpd.conf : httpd.conf
	doas install -o root -g wheel -m 0644 \
	  httpd.conf /etc/httpd.conf

/etc/iked.conf : iked.conf
	~/bin/op run --env-file=.env -- \
	  sh ../install-secretfied.sh \
	    iked.conf \
	    "-o root -g wheel -m 0600" \
	    /etc/iked.conf

/etc/munin/munin-node.conf : munin-node.conf
	doas install -o root -g wheel -m 0644 \
	munin-node.conf /etc/munin/munin-node.conf

/etc/newsyslog.conf : newsyslog.conf
	doas install -o root -g wheel -m 0644 \
	  newsyslog.conf /etc/newsyslog.conf

/etc/ntpd.conf : ntpd.conf
	doas install -o root -g wheel -m 0644 \
	  ntpd.conf /etc/ntpd.conf

/etc/pf.conf : pf.conf /etc/pf.sshbots
	doas pfctl -nf ./pf.conf
	doas install -o root -g wheel -m 0600 \
	  pf.conf /etc/pf.conf
	doas pfctl -f /etc/pf.conf

/etc/pf.sshbots : ../openbsd-skel/pf.sshbots
	doas install -o root -g wheel -m 0600 \
	  ../openbsd-skel/pf.sshbots /etc/pf.sshbots

/etc/smokeping/config : smokeping-config
	doas install -o root -g wheel -m 0644 \
	  smokeping-config /etc/smokeping/config

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

/var/unbound/etc/unbound.conf : unbound.conf
	doas unbound-checkconf unbound.conf
	doas install -o root -g _unbound -m 0640 \
	  unbound.conf /var/unbound/etc/unbound.conf
	doas rcctl reload unbound

