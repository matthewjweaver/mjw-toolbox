blackice: \
	/etc/acme-client.conf \
	/etc/avahi/avahi-daemon.conf \
	/etc/boot.conf \
	/etc/daily.local \
	/etc/dhclient.conf \
	/etc/dhcpd.conf \
	/etc/doas.conf \
	/etc/hostname.em0 \
	/etc/hostname.em1 \
	/etc/hostname.enc0 \
	/etc/hostname.enc1 \
	/etc/hostname.vlan106 \
	/etc/hostname.vlan13 \
	/etc/hostname.vlan666 \
	/etc/httpd.conf \
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
	/etc/smokeping/config \
	/etc/ssh/ssh_config \
	/etc/ssh/sshd_config \
	/etc/sysctl.conf \
	/etc/syslog.conf \
	/etc/telegraf/telegraf.conf \
	/home/grahams/bin/set-upstream-bandwidth.sh \
	/var/log/unbound \
	/var/unbound/etc/unbound.conf \
	/var/unbound/etc/adblock.conf \
	/root/.forward

/etc/acme-client.conf : acme-client.conf
	doas install -o root -g wheel -m 0644 \
	  acme-client.conf /etc/acme-client.conf

/etc/avahi/avahi-daemon.conf : avahi-daemon.conf
	@if ! [ -d /var/db/pkg/avahi-libs* ]; then pkg_add avahi; fi
	doas install -o root -g wheel -m 0644 \
	  avahi-daemon.conf /etc/avahi/avahi-daemon.conf

/etc/boot.conf : boot.conf
	doas install -o root -g wheel -m 0644 \
	  boot.conf /etc/boot.conf

/etc/daily.local : daily.local
	doas install -o root -g wheel -m 0644 \
	  daily.local /etc/daily.local

/etc/dhclient.conf : dhclient.conf
	doas install -o root -g wheel -m 0644 \
	  dhclient.conf /etc/dhclient.conf

/etc/dhcpd.conf : dhcpd.conf
	doas install -o root -g wheel -m 0644 \
	  dhcpd.conf /etc/dhcpd.conf

/etc/doas.conf : doas.conf
	doas install -o root -g wheel -m 0600 \
	  doas.conf /etc/doas.conf

/etc/hostname.em0 : hostname.em0
	doas install -o root -g wheel -m 0640 \
	  hostname.em0 /etc/hostname.em0

/etc/hostname.em1 : hostname.em1
	doas install -o root -g wheel -m 0640 \
	  hostname.em1 /etc/hostname.em1

/etc/hostname.enc0 : hostname.enc0
	doas install -o root -g wheel -m 0640 \
	  hostname.enc0 /etc/hostname.enc0

/etc/hostname.enc1 : hostname.enc1
	doas install -o root -g wheel -m 0640 \
	  hostname.enc1 /etc/hostname.enc1

/etc/hostname.vlan106 : hostname.vlan106
	doas install -o root -g wheel -m 0640 \
	  hostname.vlan106 /etc/hostname.vlan106

/etc/hostname.vlan13 : hostname.vlan13
	doas install -o root -g wheel -m 0640 \
	  hostname.vlan13 /etc/hostname.vlan13

/etc/hostname.vlan666 : hostname.vlan666
	doas install -o root -g wheel -m 0640 \
	  hostname.vlan666 /etc/hostname.vlan666

/etc/httpd.conf : httpd.conf
	doas install -o root -g wheel -m 0644 \
	  httpd.conf /etc/httpd.conf

/etc/iked.conf : iked.conf
	~/bin/op run --env-file=.env -- \
	  sh ../install-secretfied.sh \
	    iked.conf \
	    "-o root -g wheel -m 0600" \
	    /etc/iked.conf

/etc/mygate : mygate
	doas install -o root -g wheel -m 0644 \
	  mygate /etc/mygate

/etc/login.conf : login.conf
	doas install -o root -g wheel -m 0644 \
	  login.conf /etc/login.conf

/etc/newsyslog.conf : newsyslog.conf
	doas install -o root -g wheel -m 0644 \
	  newsyslog.conf /etc/newsyslog.conf

/etc/ntpd.conf : ntpd.conf
	doas install -o root -g wheel -m 0644 \
	  ntpd.conf /etc/ntpd.conf

/etc/pf.conf : pf.conf /home/grahams/bin/set-upstream-bandwidth.sh cronjob-bandwidth
	doas install -o root -g wheel -m 0600 \
	  pf.conf /etc/pf.conf
	doas /home/grahams/bin/set-upstream-bandwidth.sh
	@if ! [ -e /var/cron/tabs/grahams ]; then cat cronjob-bandwidth | doas crontab -u grahams - ; fi

/etc/pf.sshbots: ../openbsd-skel/pf.sshbots
	doas install -o root -g wheel -m 0600 \
	  ../openbsd-skel/pf.sshbots /etc/pf.sshbots

/etc/rc.conf.local : rc.conf.local
	doas install -o root -g wheel -m 0644 \
	  rc.conf.local /etc/rc.conf.local

/etc/resolv.conf : resolv.conf
	doas install -o root -g wheel -m 0644 \
	  resolv.conf /etc/resolv.conf

/etc/shells : shells
	doas install -o root -g wheel -m 0644 \
	  shells /etc/shells

/etc/smokeping/config : smokeping-config
	doas install -o root -g wheel -m 0644 \
	  smokeping-config /etc/smokeping/config
	@if ! rcctl ls on | grep smokeping > /dev/null; then doas rcctl enable smokeping; fi
	@if ! rcctl ls started | grep smokeping > /dev/null; then doas rcctl start smokeping; fi
	@if ! rcctl ls on | grep smokeping_fcgi > /dev/null; then doas rcctl enable smokeping_fcgi; fi
	@if ! rcctl ls started | grep smokeping_fcgi > /dev/null; then doas rcctl start smokeping_fcgi; fi

/etc/ssh/ssh_config : ssh_config
	doas install -o root -g wheel -m 0644 \
	  ssh_config /etc/ssh/ssh_config

/etc/ssh/sshd_config : ../openbsd-skel/sshd_config
	doas install -o root -g wheel -m 0644 \
	  ../openbsd-skel/sshd_config /etc/ssh/sshd_config

/etc/sysctl.conf : sysctl.conf
	doas install -o root -g wheel -m 0644 \
	  sysctl.conf /etc/sysctl.conf

/etc/syslog.conf : syslog.conf
	doas install -o root -g wheel -m 0644 \
	  syslog.conf /etc/syslog.conf

/etc/telegraf/telegraf.conf : telegraf.conf
	@if ! [ -d /var/db/pkg/telegraf* ]; then pkg_add telegraf; fi
	doas install -o root -g wheel -m 0644 \
	  telegraf.conf /etc/telegraf/telegraf.conf

/home/grahams/bin/set-upstream-bandwidth.sh : set-upstream-bandwidth.sh
	@if ! [ -d /home/grahams/bin ]; then mkdir /home/grahams/bin; fi
	doas install -o grahams -g grahams -m 0750 \
	  set-upstream-bandwidth.sh /home/grahams/bin/set-upstream-bandwidth.sh

/var/log/unbound :
	touch /var/log/unbound
	chown root:_unbound /var/log/unbound
	chmod 644 /var/log/unbound

/var/unbound/etc/unbound.conf : unbound.conf
	doas install -o root -g _unbound -m 0640 \
	  unbound.conf /var/unbound/etc/unbound.conf

/var/unbound/etc/adblock.conf : adblock.conf
	@if ! id -u _adblock > /dev/null; then useradd -s /sbin/nologin _adblock; fi
	ftp https://www.geoghegan.ca/pub/unbound-adblock/0.4/unbound-adblock.sh
	doas install -o root -g bin -m 0700 \
	  unbound-adblock.sh /usr/local/bin/unbound-adblock.sh
	doas install -o _adblock -g _unbound -m 0640 \
	  adblock.conf /var/unbound/etc/adblock.conf
	if ! [ -e /var/cron/tabs/_adblock ]; then cat cronjob-adblock | doas crontab -u _adblock - ; fi

/root/.forward : .forward
	doas install -o root -g wheel -m 0644 \
	  .forward /root/.forward
