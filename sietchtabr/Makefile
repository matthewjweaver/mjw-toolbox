sietchtabr: \
  /etc/acme-client.conf \
  /etc/daily.local \
  /etc/dhcpd.conf \
  /etc/dhcpcd.conf \
  /etc/doas.conf \
  /etc/hostname.bridge42 \
  /etc/hostname.em0 \
  /etc/hostname.em4 \
  /etc/hostname.em5 \
  /etc/hostname.enc1 \
  /etc/hostname.enc2 \
  /etc/hostname.enc3 \
  /etc/hostname.enc4 \
  /etc/hostname.pflow0 \
  /etc/hostname.sec0 \
  /etc/hostname.sec1 \
  /etc/hostname.sec2 \
  /etc/hostname.wg0 \
  /etc/hostname.vlan42 \
  /etc/hostname.vlan666 \
  /etc/httpd.conf \
  /etc/iked.conf \
  /etc/login.conf \
  /etc/munin/munin.conf \
  /etc/munin/munin-node.conf \
  /etc/munin/plugin-conf.d/openbsd-packages \
  /etc/munin/plugin-conf.d/taqwa.here \
  /etc/newsyslog.conf \
  /etc/ntpd.conf \
  /etc/pf.conf \
  /etc/pf.conf.vpns \
  /etc/pf.conf.lans \
  /etc/pf.conf.lan-based-services \
  /etc/pf.sshbots \
  /etc/pfstat.conf \
  /etc/rad.conf \
  /etc/rc.local \
  /etc/relayd.conf \
  /etc/resolv.conf \
  /etc/smokeping/config \
  /etc/ssh/ssh_config \
  /etc/ssh/sshd_config \
  /etc/sysctl.conf \
  /etc/syslog.conf \
  /etc/vm.conf \
  /home/sysop/bin/backup.sh \
  /home/sysop/bin/maintain.sh \
  /home/sysop/bin/mon-uplink.sh \
  /var/vmd/arrakeen.weaver.tpl.qcow2 \
  /var/vmd/axlotl-tank.here.qcow2 \
  /var/vmd/ns1.weaver.tpl.qcow2 \
  /usr/local/libexec/munin/plugins/sensors_ \
  /usr/local/libexec/munin/plugins/unbound_munin_ \
  /var/unbound/etc/unbound.conf \
  /var/www/htdocs/pf/index.html \
  /var/www/htdocs/pf/solarized-dark.min.css

/etc/acme-client.conf : acme-client.conf
	doas install -o root -g wheel -m 0644 \
	  acme-client.conf /etc/acme-client.conf

/etc/daily.local : daily.local
	doas install -o root -g wheel -m 0644 \
	  daily.local /etc/daily.local

/etc/dhcpcd.conf : dhcpcd.conf
	doas install -o root -g wheel -m 0644 \
	  dhcpcd.conf /etc/dhcpcd.conf

/etc/dhcpd.conf : dhcpd.conf
	doas dhcpd -nc dhcpd.conf
	doas install -o root -g wheel -m 0644 \
	  dhcpd.conf /etc/dhcpd.conf
	doas rcctl restart dhcpd

/etc/dhcpleased.conf : dhcpleased.conf
	doas install -o root -g wheel -m 0644 \
	  dhcpleased.conf /etc/dhcpleased.conf

/etc/doas.conf : doas.conf
	doas -C ./doas.conf
	doas install -o root -g wheel -m 0600 \
	  doas.conf /etc/doas.conf

/etc/hostname.bridge42 : hostname.bridge42
	doas install -o root -g wheel -m 0640 \
	  hostname.bridge42 /etc/hostname.bridge42

/etc/hostname.em0 : hostname.em0
	doas install -o root -g wheel -m 0640 \
	  hostname.em0 /etc/hostname.em0

/etc/hostname.em3 : hostname.em3
	doas install -o root -g wheel -m 0640 \
	  hostname.em3 /etc/hostname.em3

/etc/hostname.em4 : hostname.em4
	doas install -o root -g wheel -m 0640 \
	  hostname.em4 /etc/hostname.em4

/etc/hostname.em5 : hostname.em5
	doas install -o root -g wheel -m 0640 \
	  hostname.em5 /etc/hostname.em5

/etc/hostname.enc1 : hostname.enc1
	doas install -o root -g wheel -m 0640 \
	  hostname.enc1 /etc/hostname.enc1

/etc/hostname.enc2 : hostname.enc2
	doas install -o root -g wheel -m 0640 \
	  hostname.enc2 /etc/hostname.enc2

/etc/hostname.enc3 : hostname.enc3
	doas install -o root -g wheel -m 0640 \
	  hostname.enc3 /etc/hostname.enc3

/etc/hostname.enc4 : hostname.enc4
	doas install -o root -g wheel -m 0640 \
	  hostname.enc4 /etc/hostname.enc4

/etc/hostname.pflow0 : hostname.pflow0
	doas install -o root -g wheel -m 0640 \
	  hostname.pflow0 /etc/hostname.pflow0

/etc/hostname.sec0 : hostname.sec0
	doas install -o root -g wheel -m 0640 \
	  hostname.sec0 /etc/hostname.sec0

/etc/hostname.sec1 : hostname.sec1
	doas install -o root -g wheel -m 0640 \
	  hostname.sec1 /etc/hostname.sec1

/etc/hostname.sec2 : hostname.sec2
	doas install -o root -g wheel -m 0640 \
	  hostname.sec2 /etc/hostname.sec2

/etc/hostname.wg0 : hostname.wg0
	~/bin/op run --env-file=.env -- \
	  sh ../install-secretfied.sh \
	    hostname.wg0 \
	    "-o root -g wheel -m 0640" \
	    /etc/hostname.wg0

/etc/hostname.vlan42 : hostname.vlan42
	doas install -o root -g wheel -m 0640 \
	  hostname.vlan42 /etc/hostname.vlan42

/etc/hostname.vlan666 : hostname.vlan666
	doas install -o root -g wheel -m 0640 \
	  hostname.vlan666 /etc/hostname.vlan666

/etc/httpd.conf : httpd.conf
	doas httpd -nf httpd.conf
	doas install -o root -g wheel -m 0644 \
	  httpd.conf /etc/httpd.conf
	doas rcctl reload httpd

/etc/iked.conf : iked.conf
	~/bin/op run --env-file=.env -- \
	  sh ../install-secretfied.sh \
	    iked.conf \
	    "-o root -g wheel -m 0600" \
	    /etc/iked.conf

/etc/login.conf : login.conf
	doas install -o root -g wheel -m 0644 \
	  login.conf /etc/login.conf

/etc/munin/munin.conf : munin.conf
	doas install -o root -g wheel -m 0644 \
	  munin.conf /etc/munin/munin.conf

/etc/munin/munin-node.conf : munin-node.conf
	doas install -o root -g wheel -m 0644 \
	  munin-node.conf /etc/munin/munin-node.conf

/etc/munin/plugin-conf.d/openbsd-packages : openbsd-packages
	doas install -o root -g wheel -m 0644 \
	  openbsd-packages /etc/munin/plugin-conf.d/openbsd-packages

/etc/newsyslog.conf : newsyslog.conf
	doas install -o root -g wheel -m 0644 \
	  newsyslog.conf /etc/newsyslog.conf

/etc/ntpd.conf : ntpd.conf
	doas ntpd -nf ./ntpd.conf
	doas install -o root -g wheel -m 0644 \
	  ntpd.conf /etc/ntpd.conf
	doas rcctl restart ntpd

/etc/pf.conf : pf.conf /etc/pf.conf.lans /etc/pf.conf.lan-based-services /etc/pf.conf.vpns /etc/pf.sshbots /etc/rc.local
	doas pfctl -nf pf.conf
	doas install -o root -g wheel -m 0600 \
	  pf.conf /etc/pf.conf
	doas pfctl -f /etc/pf.conf && doas sh /etc/rc.local

/etc/pf.conf.lans : pf.conf.lans
	doas pfctl -nf pf.conf.lans
	doas install -o root -g wheel -m 0600 \
	  pf.conf.lans /etc/pf.conf.lans

/etc/pf.conf.lan-based-services : pf.conf.lan-based-services
	doas pfctl -nf pf.conf.lan-based-services
	doas install -o root -g wheel -m 0600 \
	  pf.conf.lan-based-services /etc/pf.conf.lan-based-services

/etc/pf.conf.vpns : pf.conf.vpns
	doas pfctl -nf pf.conf.vpns
	doas install -o root -g wheel -m 0600 \
	  pf.conf.vpns /etc/pf.conf.vpns

/etc/pf.sshbots : ../openbsd-skel/pf.sshbots
	doas install -o root -g wheel -m 0640 \
	  ../openbsd-skel/pf.sshbots /etc/pf.sshbots

/etc/pfstat.conf : pfstat.conf
	doas install -o root -g wheel -m 0644 \
	  pfstat.conf /etc/pfstat.conf

/etc/rad.conf : rad.conf
	doas install -o root -g wheel -m 0644 \
	  rad.conf /etc/rad.conf

/etc/rc.local : rc.local
	doas install -o root -g wheel -m 0644 \
	  rc.local /etc/rc.local

/etc/relayd.conf : relayd.conf
	doas relayd -nf ./relayd.conf
	doas install -o root -g wheel -m 0600 \
	  relayd.conf /etc/relayd.conf
	doas rcctl reload relayd

/etc/resolv.conf : resolv.conf
	doas install -o root -g wheel -m 0644 \
	  resolv.conf /etc/resolv.conf

/etc/smokeping/config : smokeping-config
	doas install -o root -g wheel -m 0644 \
	  smokeping-config /etc/smokeping/config

/etc/ssh/ssh_config : ssh_config
	doas install -o root -g wheel -m 0644 \
	  ssh_config /etc/ssh/ssh_config

/etc/ssh/sshd_config : sshd_config
	doas install -o root -g wheel -m 0644 \
	  sshd_config /etc/ssh/sshd_config

/etc/syslog.conf : syslog.conf
	doas install -o root -g wheel -m 0644 \
	  syslog.conf /etc/syslog.conf

/etc/sysctl.conf : sysctl.conf
	doas install -o root -g wheel -m 0644 \
	  sysctl.conf /etc/sysctl.conf

/etc/vm.conf : vm.conf /var/vmd/ns1.weaver.tpl.qcow2 /var/vmd/arrakeen.weaver.tpl.qcow2 /var/vmd/axlotl-tank.here.qcow2
	doas vmd -ndf ./vm.conf
	doas install -o root -g wheel -m 0644 \
	  vm.conf /etc/vm.conf

/home/sysop/bin/backup.sh : backup.sh
	doas install -o sysop -g wheel -m 0750 \
	  backup.sh /home/sysop/bin/backup.sh

/home/sysop/bin/maintain.sh : maintain.sh
	doas install -o sysop -g wheel -m 0750 \
	  maintain.sh /home/sysop/bin/maintain.sh

/home/sysop/bin/mon-uplink.sh : mon-uplink.sh
	doas install -o sysop -g wheel -m 0750 \
	  mon-uplink.sh /home/sysop/bin/mon-uplink.sh

/var/vmd/arrakeen.weaver.tpl.qcow2 :
	vmctl create -s 256G /var/vmd/arrakeen.weaver.tpl.qcow2
	doas chown sysop._vmd /var/vmd/arrakeen.weaver.tpl.qcow2
	doas chmod 660 /var/vmd/arrakeen.weaver.tpl.qcow2

/var/vmd/axlotl-tank.here.qcow2 :
	vmctl create -s 1T /var/vmd/axlotl-tank.here.qcow2
	doas chown sysop._vmd /var/vmd/axlotl-tank.here.qcow2
	doas chmod 660 /var/vmd/axlotl-tank.here.qcow2

/var/vmd/ns1.weaver.tpl.qcow2 :
	vmctl create -s 4G /var/vmd/ns1.weaver.tpl.qcow2
	doas chown sysop._vmd /var/vmd/ns1.weaver.tpl.qcow2
	doas chmod 660 /var/vmd/ns1.weaver.tpl.qcow2

/usr/local/libexec/munin/plugins/sensors_ : sensors_
	doas install -o root -g bin -m 0755 \
	  sensors_ /usr/local/libexec/munin/plugins/sensors_

/usr/local/libexec/munin/plugins/unbound_munin_ : unbound_munin_
	doas install -o root -g bin -m 0755 \
	  unbound_munin_ /usr/local/libexec/munin/plugins/unbound_munin_

/var/unbound/etc/unbound.conf : unbound.conf
	doas unbound-checkconf unbound.conf
	doas install -o root -g _unbound -m 0640 \
	  unbound.conf /var/unbound/etc/unbound.conf
	doas rcctl reload unbound

/var/www/htdocs/pf/index.html : pf-index.html
	doas install -o root -g daemon -m 0644 \
	  pf-index.html /var/www/htdocs/pf/index.html

/var/www/htdocs/pf/solarized-dark.min.css : solarized-dark.min.css
	doas install -o root -g daemon -m 0644 \
	  solarized-dark.min.css /var/www/htdocs/pf/solarized-dark.min.css

