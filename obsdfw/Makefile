obsdfw: \
	/etc/acme-client.conf \
	/etc/avahi/avahi-daemon.conf \
	/etc/boot.conf \
	/etc/dhclient.conf \
	/etc/dhcpd.conf \
	/etc/doas.conf \
	/etc/hostname.em0 \
	/etc/hostname.em1 \
	/etc/hostname.enc0 \
	/etc/hostname.vlan106 \
	/etc/hostname.vlan13 \
	/etc/hostname.vlan666 \
	/etc/hostname.wg1 \
	/etc/iked.conf \
	/etc/mygate \
	/etc/login.conf \
	/etc/newsyslog.conf \
	/etc/ntpd.conf \
	/etc/pf.conf \
	/etc/pf.sshbots \
	/etc/rc.conf.local \
	/etc/resolv.conf \
	/etc/shells \
	/etc/ssh/ssh_config \
	/etc/ssh/sshd_config \
	/etc/sysctl.conf \
	/etc/syslog.conf \
	/etc/telegraf/telegraf.conf \
	/etc/nut/upsmon.conf \
	/var/log/unbound \
	/var/unbound/etc/unbound.conf \
	/var/unbound/etc/adblock.conf \
	/root/.forward

/etc/acme-client.conf : acme-client.conf
	install -o root -g wheel -m 0644 \
	  acme-client.conf /etc/acme-client.conf

/etc/avahi/avahi-daemon.conf : avahi-daemon.conf
	install -o root -g wheel -m 0644 \
	  avahi-daemon.conf /etc/avahi/avahi-daemon.conf

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

/etc/hostname.vlan106 : hostname.vlan106
	install -o root -g wheel -m 0640 \
	  hostname.vlan106 /etc/hostname.vlan106

/etc/hostname.vlan13 : hostname.vlan13
	install -o root -g wheel -m 0640 \
	  hostname.vlan13 /etc/hostname.vlan13

/etc/hostname.vlan666 : hostname.vlan666
	install -o root -g wheel -m 0640 \
	  hostname.vlan666 /etc/hostname.vlan666

/etc/hostname.wg1 : hostname.wg1
	install -o root -g wheel -m 0640 \
	  hostname.wg1 /etc/hostname.wg1
	@echo "************ Fix XXXLOLXXX in /etc/hostname.wg1 ************"

/etc/iked.conf : iked.conf
	install -o root -g wheel -m 0600 \
	  iked.conf /etc/iked.conf
	@echo "************ Fix PSK in /etc/iked.conf ************"

/etc/mygate : mygate
	install -o root -g wheel -m 0644 \
	  mygate /etc/mygate

/etc/login.conf : login.conf
	install -o root -g wheel -m 0644 \
	  login.conf /etc/login.conf

/etc/newsyslog.conf : newsyslog.conf
	install -o root -g wheel -m 0644 \
	  newsyslog.conf /etc/newsyslog.conf

/etc/ntpd.conf : ntpd.conf
	install -o root -g wheel -m 0644 \
	  ntpd.conf /etc/ntpd.conf

/etc/pf.conf : pf.conf
	install -o root -g wheel -m 0600 \
	  pf.conf /etc/pf.conf

/etc/pf.sshbots: ../openbsd-skel/pf.sshbots
	install -o root -g wheel -m 0600 \
	  ../openbsd-skel/pf.sshbots /etc/pf.sshbots

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

/etc/ssh/sshd_config : ../openbsd-skel/sshd_config
	install -o root -g wheel -m 0644 \
	  ../openbsd-skel/sshd_config /etc/ssh/sshd_config

/etc/sysctl.conf : sysctl.conf
	install -o root -g wheel -m 0644 \
	  sysctl.conf /etc/sysctl.conf

/etc/syslog.conf : syslog.conf
	install -o root -g wheel -m 0644 \
	  syslog.conf /etc/syslog.conf

/etc/telegraf/telegraf.conf : telegraf.conf
	@if ! [ -d /var/db/pkg/telegraf* ]; then pkg_add telegraf; fi
	install -o root -g wheel -m 0644 \
	  telegraf.conf /etc/telegraf/telegraf.conf

/etc/nut/upsmon.conf : upsmon.conf
	@if ! [ -d /var/db/pkg/nut* ]; then pkg_add nut; fi
	install -o _ups -g wheel -m 0600 \
	  upsmon.conf /etc/nut/upsmon.conf
	@if ! rcctl ls on | grep upsmon > /dev/null; then rcctl enable upsmon; fi
	@if ! rcctl ls started | grep upsmon > /dev/null; then rcctl start upsmon; fi

/var/log/unbound :
	touch /var/log/unbound
	chown root:_unbound /var/log/unbound
	chmod 644 /var/log/unbound

/var/unbound/etc/unbound.conf : unbound.conf
	install -o root -g _unbound -m 0640 \
	  unbound.conf /var/unbound/etc/unbound.conf

/var/unbound/etc/adblock.conf : adblock.conf
	@if ! id -u _adblock > /dev/null; then useradd -s /sbin/nologin _adblock; fi
	ftp https://www.geoghegan.ca/pub/unbound-adblock/0.4/unbound-adblock.sh
	install -o root -g bin -m 0700 \
	  unbound-adblock.sh /usr/local/bin/unbound-adblock.sh
	install -o _adblock -g _unbound -m 0640 \
	  adblock.conf /var/unbound/etc/adblock.conf
	if ! [ -e /var/cron/tabs/_adblock ]; then cat cronjob-adblock | doas crontab -u _adblock - ; fi

/root/.forward : .forward
	install -o root -g wheel -m 0644 \
	  .forward /root/.forward
