obsdfw: \
	/etc/acme-client.conf \
	/etc/boot.conf \
	/etc/dhclient.conf \
	/etc/dhcpd.conf \
	/etc/doas.conf \
	/etc/hostname.em0 \
	/etc/hostname.em1 \
	/etc/hostname.enc0 \
	/etc/hostname.vlan100 \
	/etc/hostname.vlan13 \
	/etc/hostname.vlan666 \
	/etc/iked.conf \
	/etc/mygate \
	/etc/login.conf \
	/etc/miniupnpd.conf \
	/etc/newsyslog.conf \
	/etc/ntpd.conf \
	/etc/pf.conf \
	/etc/rc.conf.local \
	/etc/resolv.conf \
	/etc/shells \
	/etc/ssh/ssh_config \
	/etc/ssh/sshd_config \
	/etc/sysctl.conf \
	/etc/syslog.conf \
	/etc/nut/upsmon.conf \
	/var/unbound/etc/unbound.conf \
	/var/unbound/etc/adblock.conf 
	@echo "************ Fix PSK in /etc/iked.conf ************"

/etc/acme-client.conf : acme-client.conf
	install -o root -g wheel -m 0644 \
	  acme-client.conf /etc/acme-client.conf

/etc/boot.conf : boot.conf
	install -o root -g wheel -m 0644 \
	  boot.conf /etc/boot.conf

/etc/dhclient.conf : dhclient.conf
	install -o root -g wheel -m 0644 \
	  dhclient.conf /etc/dhclient.conf

/etc/dhcpd.conf : dhcpd.conf
	install -o root -g wheel -m 0644 \
	  dhcpd.conf /etc/dhcpd.conf

/etc/doas.conf : doas.conf
	install -o root -g wheel -m 0600 \
	  doas.conf /etc/doas.conf

/etc/hostname.em0 : hostname.em0
	install -o root -g wheel -m 0640 \
	  hostname.em0 /etc/hostname.em0

/etc/hostname.em1 : hostname.em1
	install -o root -g wheel -m 0640 \
	  hostname.em1 /etc/hostname.em1

/etc/hostname.enc0 : hostname.enc0
	install -o root -g wheel -m 0640 \
	  hostname.enc0 /etc/hostname.enc0

/etc/hostname.vlan100 : hostname.vlan100
	install -o root -g wheel -m 0640 \
	  hostname.vlan100 /etc/hostname.vlan100

/etc/hostname.vlan13 : hostname.vlan13
	install -o root -g wheel -m 0640 \
	  hostname.vlan13 /etc/hostname.vlan13

/etc/hostname.vlan666 : hostname.vlan666
	install -o root -g wheel -m 0640 \
	  hostname.vlan666 /etc/hostname.vlan666

/etc/iked.conf : iked.conf
	install -o root -g wheel -m 0600 \
	  iked.conf /etc/iked.conf

/etc/mygate : mygate
	install -o root -g wheel -m 0644 \
	  mygate /etc/mygate

/etc/login.conf : login.conf
	install -o root -g wheel -m 0644 \
	  login.conf /etc/login.conf

/etc/miniupnpd.conf : miniupnpd.conf
	install -o root -g wheel -m 0644 \
	  miniupnd.conf /etc/miniupnpd.conf

/etc/newsyslog.conf : newsyslog.conf
	install -o root -g wheel -m 0644 \
	  newsyslog.conf /etc/newsyslog.conf

/etc/ntpd.conf : ntpd.conf
	install -o root -g wheel -m 0644 \
	  ntpd.conf /etc/ntpd.conf

/etc/pf.conf : pf.conf
	install -o root -g wheel -m 0600 \
	  pf.conf /etc/pf.conf

/etc/rc.conf.local : rc.conf.local
	install -o root -g wheel -m 0644 \
	  rc.conf.local /etc/rc.conf.local

/etc/resolv.conf : resolv.conf
	install -o root -g wheel -m 0644 \
	  resolv.conf /etc/resolv.conf

/etc/shells : shells
	install -o root -g wheel -m 0644 \
	  shells /etc/shells

/etc/ssh/ssh_config : ssh_config
	install -o root -g wheel -m 0644 \
	  ssh_config /etc/ssh/ssh_config

/etc/ssh/sshd_config : sshd_config
	install -o root -g wheel -m 0644 \
	  sshd_config /etc/ssh/sshd_config

/etc/sysctl.conf : sysctl.conf
	install -o root -g wheel -m 0644 \
	  sysctl.conf /etc/sysctl.conf

/etc/syslog.conf : syslog.conf
	install -o root -g wheel -m 0644 \
	  syslog.conf /etc/syslog.conf

/etc/nut/upsmon.conf : upsmon.conf
	install -o _ups -g wheel -m 0600 \
	  upsmon.conf /etc/nut/upsmon.conf

/var/unbound/etc/unbound.conf : unbound.conf
	install -o root -g _unbound -m 0640 \
	  unbound.conf /var/unbound/etc/unbound.conf

/var/unbound/etc/adblock.conf : adblock.conf
	install -o _adblock -g _unbound -m 0640 \
	  adblock.conf /var/unbound/etc/adblock.conf

