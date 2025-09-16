FAKE_ROOT=fakeroot

fakeroot : \
  ${FAKE_ROOT}/etc \
  ${FAKE_ROOT}/etc/munin \
  ${FAKE_ROOT}/etc/munin/plugin-conf.d \
  ${FAKE_ROOT}/etc/smokeping \
  ${FAKE_ROOT}/etc/ssh/ \
  ${FAKE_ROOT}/home/sysop/bin \
  ${FAKE_ROOT}/usr/local/libexec/munin/plugins/ \
  ${FAKE_ROOT}/tmp/ \
  ${FAKE_ROOT}/var/unbound/etc \
  ${FAKE_ROOT}/var/www/etc \
  ${FAKE_ROOT}/var/www/htdocs/pfstat

${FAKE_ROOT}/etc :
	mkdir -p ${FAKE_ROOT}/etc

${FAKE_ROOT}/etc/munin :
	mkdir -p ${FAKE_ROOT}/etc/munin

${FAKE_ROOT}/etc/munin/plugin-conf.d :
	mkdir -p ${FAKE_ROOT}/etc/munin/plugin-conf.d

${FAKE_ROOT}/etc/smokeping :
	mkdir -p ${FAKE_ROOT}/etc/smokeping

${FAKE_ROOT}/etc/ssh/ :
	mkdir -p ${FAKE_ROOT}/etc/ssh/

${FAKE_ROOT}/home/sysop/bin :
	mkdir -p ${FAKE_ROOT}/home/sysop/bin

${FAKE_ROOT}/usr/local/libexec/munin/plugins/ :
	mkdir -p ${FAKE_ROOT}/usr/local/libexec/munin/plugins/

${FAKE_ROOT}/tmp/ :
	mkdir -p ${FAKE_ROOT}/tmp/

${FAKE_ROOT}/var/unbound/etc :
	mkdir -p ${FAKE_ROOT}/var/unbound/etc

${FAKE_ROOT}/var/www/etc :
	mkdir -p ${FAKE_ROOT}/var/www/etc

${FAKE_ROOT}/var/www/htdocs/pfstat :
	mkdir -p ${FAKE_ROOT}/var/www/htdocs/pfstat

sietchtabr: fakeroot \
  ${FAKE_ROOT}/etc/acme-client.conf \
  ${FAKE_ROOT}/etc/daily.local \
  ${FAKE_ROOT}/etc/dhcpd.conf \
  ${FAKE_ROOT}/etc/dhcpcd.conf \
  ${FAKE_ROOT}/etc/doas.conf \
  ${FAKE_ROOT}/etc/exports \
  ${FAKE_ROOT}/etc/hostname.bridge0 \
  ${FAKE_ROOT}/etc/hostname.bridge23 \
  ${FAKE_ROOT}/etc/hostname.bridge42 \
  ${FAKE_ROOT}/etc/hostname.em0 \
  ${FAKE_ROOT}/etc/hostname.em1 \
  ${FAKE_ROOT}/etc/hostname.enc1 \
  ${FAKE_ROOT}/etc/hostname.enc2 \
  ${FAKE_ROOT}/etc/hostname.enc3 \
  ${FAKE_ROOT}/etc/hostname.enc4 \
  ${FAKE_ROOT}/etc/hostname.gre0 \
  ${FAKE_ROOT}/etc/hostname.ixl0 \
  ${FAKE_ROOT}/etc/hostname.pflow0 \
  ${FAKE_ROOT}/etc/hostname.sec0 \
  ${FAKE_ROOT}/etc/hostname.sec1 \
  ${FAKE_ROOT}/etc/hostname.sec2 \
  ${FAKE_ROOT}/etc/hostname.vether0 \
  ${FAKE_ROOT}/etc/hostname.vether23 \
  ${FAKE_ROOT}/etc/hostname.vlan42 \
  ${FAKE_ROOT}/etc/hostname.vlan666 \
  ${FAKE_ROOT}/etc/httpd.conf \
  ${FAKE_ROOT}/etc/iked.conf \
  ${FAKE_ROOT}/etc/login.conf \
  ${FAKE_ROOT}/etc/mk.conf \
  ${FAKE_ROOT}/etc/monthly.local \
  ${FAKE_ROOT}/etc/munin/munin.conf \
  ${FAKE_ROOT}/etc/munin/munin-node.conf \
  ${FAKE_ROOT}/etc/munin/plugin-conf.d/openbsd-packages \
  ${FAKE_ROOT}/etc/newsyslog.conf \
  ${FAKE_ROOT}/etc/nfsen.conf \
  ${FAKE_ROOT}/etc/ntpd.conf \
  ${FAKE_ROOT}/etc/pf.conf \
  ${FAKE_ROOT}/etc/pf.conf.vpns \
  ${FAKE_ROOT}/etc/pf.conf.lans \
  ${FAKE_ROOT}/etc/pf.sshbots \
  ${FAKE_ROOT}/etc/pfstat.conf \
  ${FAKE_ROOT}/etc/rc.local \
  ${FAKE_ROOT}/etc/relayd.conf \
  ${FAKE_ROOT}/etc/resolv.conf \
  ${FAKE_ROOT}/etc/smokeping/config \
  ${FAKE_ROOT}/etc/ssh/ssh_config \
  ${FAKE_ROOT}/etc/ssh/sshd_config \
  ${FAKE_ROOT}/etc/sysctl.conf \
  ${FAKE_ROOT}/etc/syslog.conf \
  ${FAKE_ROOT}/etc/vm.conf \
  ${FAKE_ROOT}/home/sysop/bin/mon-uplink.sh \
  ${FAKE_ROOT}/usr/local/libexec/munin/plugins/sensors_ \
  ${FAKE_ROOT}/usr/local/libexec/munin/plugins/unbound_munin_ \
  ${FAKE_ROOT}/var/unbound/etc/unbound.conf \
  ${FAKE_ROOT}/var/www/etc/hosts \
  ${FAKE_ROOT}/var/www/htdocs/pfstat/index.html \
  ${FAKE_ROOT}/var/www/htdocs/pfstat/solarized-dark.min.css

${FAKE_ROOT}/etc/acme-client.conf : acme-client.conf
	doas install -o root -g wheel -m 0644 \
	  acme-client.conf ${FAKE_ROOT}/etc/acme-client.conf

${FAKE_ROOT}/etc/daily.local : daily.local
	doas install -o root -g wheel -m 0644 \
	  daily.local ${FAKE_ROOT}/etc/daily.local

${FAKE_ROOT}/etc/dhcpcd.conf : dhcpcd.conf
	doas install -o root -g wheel -m 0644 \
	  dhcpcd.conf ${FAKE_ROOT}/etc/dhcpcd.conf

${FAKE_ROOT}/etc/dhcpd.conf : dhcpd.conf
	echo "dhcpd -nc etc/dhcpd.conf" \
	  >> ${FAKE_ROOT}/tmp/test-payload-commands
	doas install -o root -g wheel -m 0644 \
	  dhcpd.conf ${FAKE_ROOT}/etc/dhcpd.conf
	echo "rcctl restart dhcpd" \
	  >> ${FAKE_ROOT}/tmp/load-payload-commands

${FAKE_ROOT}/etc/dhcpleased.conf : dhcpleased.conf
	doas install -o root -g wheel -m 0644 \
	  dhcpleased.conf ${FAKE_ROOT}/etc/dhcpleased.conf

${FAKE_ROOT}/etc/doas.conf : doas.conf
	#doas -C ./doas.conf
	doas install -o root -g wheel -m 0600 \
	  doas.conf ${FAKE_ROOT}/etc/doas.conf

${FAKE_ROOT}/etc/exports : exports
	doas install -o root -g wheel -m 0644 \
	  exports ${FAKE_ROOT}/etc/exports

${FAKE_ROOT}/etc/hostname.bridge0 : hostname.bridge0
	doas install -o root -g wheel -m 0640 \
	  hostname.bridge0 ${FAKE_ROOT}/etc/hostname.bridge0

${FAKE_ROOT}/etc/hostname.bridge23 : hostname.bridge23
	doas install -o root -g wheel -m 0640 \
	  hostname.bridge23 ${FAKE_ROOT}/etc/hostname.bridge23

${FAKE_ROOT}/etc/hostname.bridge42 : hostname.bridge42
	doas install -o root -g wheel -m 0640 \
	  hostname.bridge42 ${FAKE_ROOT}/etc/hostname.bridge42

${FAKE_ROOT}/etc/hostname.em0 : hostname.em0
	doas install -o root -g wheel -m 0640 \
	  hostname.em0 ${FAKE_ROOT}/etc/hostname.em0

${FAKE_ROOT}/etc/hostname.em1 : hostname.em1
	doas install -o root -g wheel -m 0640 \
	  hostname.em1 ${FAKE_ROOT}/etc/hostname.em1

${FAKE_ROOT}/etc/hostname.enc1 : hostname.enc1
	doas install -o root -g wheel -m 0640 \
	  hostname.enc1 ${FAKE_ROOT}/etc/hostname.enc1

${FAKE_ROOT}/etc/hostname.enc2 : hostname.enc2
	doas install -o root -g wheel -m 0640 \
	  hostname.enc2 ${FAKE_ROOT}/etc/hostname.enc2

${FAKE_ROOT}/etc/hostname.enc3 : hostname.enc3
	doas install -o root -g wheel -m 0640 \
	  hostname.enc3 ${FAKE_ROOT}/etc/hostname.enc3

${FAKE_ROOT}/etc/hostname.enc4 : hostname.enc4
	doas install -o root -g wheel -m 0640 \
	  hostname.enc4 ${FAKE_ROOT}/etc/hostname.enc4

${FAKE_ROOT}/etc/hostname.gre0 : hostname.gre0
	doas install -o root -g wheel -m 0640 \
	  hostname.gre0 ${FAKE_ROOT}/etc/hostname.gre0

${FAKE_ROOT}/etc/hostname.ixl0 : hostname.ixl0
	doas install -o root -g wheel -m 0640 \
	  hostname.ixl0 ${FAKE_ROOT}/etc/hostname.ixl0

${FAKE_ROOT}/etc/hostname.pflow0 : hostname.pflow0
	doas install -o root -g wheel -m 0640 \
	  hostname.pflow0 ${FAKE_ROOT}/etc/hostname.pflow0

${FAKE_ROOT}/etc/hostname.sec0 : hostname.sec0
	doas install -o root -g wheel -m 0640 \
	  hostname.sec0 ${FAKE_ROOT}/etc/hostname.sec0

${FAKE_ROOT}/etc/hostname.sec1 : hostname.sec1
	doas install -o root -g wheel -m 0640 \
	  hostname.sec1 ${FAKE_ROOT}/etc/hostname.sec1

${FAKE_ROOT}/etc/hostname.sec2 : hostname.sec2
	doas install -o root -g wheel -m 0640 \
	  hostname.sec2 ${FAKE_ROOT}/etc/hostname.sec2

${FAKE_ROOT}/etc/hostname.vether0 : hostname.vether0
	doas install -o root -g wheel -m 0640 \
	  hostname.vether0 ${FAKE_ROOT}/etc/hostname.vether0

${FAKE_ROOT}/etc/hostname.vether23 : hostname.vether23
	doas install -o root -g wheel -m 0640 \
	  hostname.vether23 ${FAKE_ROOT}/etc/hostname.vether23

${FAKE_ROOT}/etc/hostname.vlan42 : hostname.vlan42
	doas install -o root -g wheel -m 0640 \
	  hostname.vlan42 ${FAKE_ROOT}/etc/hostname.vlan42

${FAKE_ROOT}/etc/hostname.vlan666 : hostname.vlan666
	doas install -o root -g wheel -m 0640 \
	  hostname.vlan666 ${FAKE_ROOT}/etc/hostname.vlan666

${FAKE_ROOT}/etc/httpd.conf : httpd.conf
	echo "httpd -nf etc/httpd.conf" \
	  >> ${FAKE_ROOT}/tmp/test-payload-commands
	doas install -o root -g wheel -m 0644 \
	  httpd.conf ${FAKE_ROOT}/etc/httpd.conf
	echo "rcctl reload httpd" \
	  >> ${FAKE_ROOT}/tmp/load-payload-commands

${FAKE_ROOT}/etc/iked.conf : iked.conf
	~/bin/op run --env-file=.env -- \
	  sh ../install-secretfied.sh \
	    iked.conf \
	    "-o root -g wheel -m 0600" \
	    ${FAKE_ROOT}/etc/iked.conf

${FAKE_ROOT}/etc/login.conf : login.conf
	doas install -o root -g wheel -m 0644 \
	  login.conf ${FAKE_ROOT}/etc/login.conf

${FAKE_ROOT}/etc/mk.conf : mk.conf
	doas install -o root -g wheel -m 0644 \
	  mk.conf ${FAKE_ROOT}/etc/mk.conf

${FAKE_ROOT}/etc/monthly.local : monthly.local
	doas install -o root -g wheel -m 0644 \
	  monthly.local ${FAKE_ROOT}/etc/monthly.local

${FAKE_ROOT}/etc/munin/munin.conf : munin.conf
	doas install -o root -g wheel -m 0644 \
	  munin.conf ${FAKE_ROOT}/etc/munin/munin.conf

${FAKE_ROOT}/etc/munin/munin-node.conf : munin-node.conf
	doas install -o root -g wheel -m 0644 \
	  munin-node.conf ${FAKE_ROOT}/etc/munin/munin-node.conf

${FAKE_ROOT}/etc/munin/plugin-conf.d/openbsd-packages : openbsd-packages
	doas install -o root -g wheel -m 0644 \
	  openbsd-packages ${FAKE_ROOT}/etc/munin/plugin-conf.d/openbsd-packages

${FAKE_ROOT}/etc/newsyslog.conf : newsyslog.conf
	doas install -o root -g wheel -m 0644 \
	  newsyslog.conf ${FAKE_ROOT}/etc/newsyslog.conf

${FAKE_ROOT}/etc/nfsen.conf : nfsen.conf
	doas install -o root -g wheel -m 0644 \
	  nfsen.conf ${FAKE_ROOT}/etc/nfsen.conf
	echo "install-nfsen.pl ${FAKE_ROOT}/etc/nfsen.conf" \
	  >> ${FAKE_ROOT}/tmp/load-payload-commands

${FAKE_ROOT}/etc/ntpd.conf : ntpd.conf
	echo "ntpd -nf etc/ntpd.conf" \
	  >> ${FAKE_ROOT}/tmp/test-payload-commands
	doas install -o root -g wheel -m 0644 \
	  ntpd.conf ${FAKE_ROOT}/etc/ntpd.conf
	echo "rcctl restart ntpd" \
	  >> ${FAKE_ROOT}/tmp/load-payload-commands

${FAKE_ROOT}/etc/pf.conf : pf.conf ${FAKE_ROOT}/etc/pf.conf.lans ${FAKE_ROOT}/etc/pf.conf.vpns ${FAKE_ROOT}/etc/pf.sshbots ${FAKE_ROOT}/etc/rc.local
	echo "pfctl -nf etc/pf.conf" \
	  >> ${FAKE_ROOT}/tmp/test-payload-commands
	doas install -o root -g wheel -m 0600 \
	  pf.conf ${FAKE_ROOT}/etc/pf.conf
	echo "pfctl -f /etc/pf.conf && sh /etc/rc.local" \
	  >> ${FAKE_ROOT}/tmp/load-payload-commands

${FAKE_ROOT}/etc/pf.conf.lans : pf.conf.lans
	echo "pfctl -nf etc/pf.conf.lans" \
	  >> ${FAKE_ROOT}/tmp/test-payload-commands
	doas install -o root -g wheel -m 0600 \
	  pf.conf.lans ${FAKE_ROOT}/etc/pf.conf.lans

${FAKE_ROOT}/etc/pf.conf.vpns : pf.conf.vpns
	echo "pfctl -nf etc/pf.conf.vpns" \
	  >> ${FAKE_ROOT}/tmp/test-payload-commands
	doas install -o root -g wheel -m 0600 \
	  pf.conf.vpns ${FAKE_ROOT}/etc/pf.conf.vpns

${FAKE_ROOT}/etc/pf.sshbots : ../openbsd-skel/pf.sshbots
	doas install -o root -g wheel -m 0640 \
	  ../openbsd-skel/pf.sshbots ${FAKE_ROOT}/etc/pf.sshbots

${FAKE_ROOT}/etc/pfstat.conf : pfstat.conf
	doas install -o root -g wheel -m 0644 \
	  pfstat.conf ${FAKE_ROOT}/etc/pfstat.conf

${FAKE_ROOT}/etc/rc.local : rc.local
	doas install -o root -g wheel -m 0644 \
	  rc.local ${FAKE_ROOT}/etc/rc.local

${FAKE_ROOT}/etc/relayd.conf : relayd.conf
	echo "relayd -nf etc/relayd.conf" \
	  >> ${FAKE_ROOT}/tmp/test-payload-commands
	doas install -o root -g wheel -m 0600 \
	  relayd.conf ${FAKE_ROOT}/etc/relayd.conf
	echo "rcctl reload relayd" \
	  >> ${FAKE_ROOT}/tmp/load-payload-commands

${FAKE_ROOT}/etc/resolv.conf : resolv.conf
	doas install -o root -g wheel -m 0644 \
	  resolv.conf ${FAKE_ROOT}/etc/resolv.conf

${FAKE_ROOT}/etc/smokeping/config : smokeping-config
	doas install -o root -g wheel -m 0644 \
	  smokeping-config ${FAKE_ROOT}/etc/smokeping/config

${FAKE_ROOT}/etc/ssh/ssh_config : ssh_config
	doas install -o root -g wheel -m 0644 \
	  ssh_config ${FAKE_ROOT}/etc/ssh/ssh_config

${FAKE_ROOT}/etc/ssh/sshd_config : sshd_config
	doas install -o root -g wheel -m 0644 \
	  sshd_config ${FAKE_ROOT}/etc/ssh/sshd_config

${FAKE_ROOT}/etc/syslog.conf : syslog.conf
	doas install -o root -g wheel -m 0644 \
	  syslog.conf ${FAKE_ROOT}/etc/syslog.conf

${FAKE_ROOT}/etc/sysctl.conf : sysctl.conf
	doas install -o root -g wheel -m 0644 \
	  sysctl.conf ${FAKE_ROOT}/etc/sysctl.conf

${FAKE_ROOT}/etc/vm.conf : vm.conf
	echo "vmd -ndf etc/vm.conf" \
	  >> ${FAKE_ROOT}/tmp/test-payload-commands
	doas install -o root -g wheel -m 0644 \
	  vm.conf ${FAKE_ROOT}/etc/vm.conf
	echo "rcctl reload vmd" \
	  >> ${FAKE_ROOT}/tmp/load-payload-commands

${FAKE_ROOT}/home/sysop/bin/mon-uplink.sh : mon-uplink.sh
	doas install -o sysop -g wheel -m 0750 \
	  mon-uplink.sh ${FAKE_ROOT}/home/sysop/bin/mon-uplink.sh

${FAKE_ROOT}/usr/local/libexec/munin/plugins/sensors_ : sensors_
	doas install -o root -g bin -m 0755 \
	  sensors_ ${FAKE_ROOT}/usr/local/libexec/munin/plugins/sensors_

${FAKE_ROOT}/usr/local/libexec/munin/plugins/unbound_munin_ : unbound_munin_
	doas install -o root -g bin -m 0755 \
	  unbound_munin_ ${FAKE_ROOT}/usr/local/libexec/munin/plugins/unbound_munin_

${FAKE_ROOT}/var/unbound/etc/unbound.conf : unbound.conf
	echo "unbound-checkconf var/unbound/etc/unbound.conf" \
	  >> ${FAKE_ROOT}/tmp/test-payload-commands
	doas install -o root -g _unbound -m 0640 \
	  unbound.conf ${FAKE_ROOT}/var/unbound/etc/unbound.conf
	echo "rcctl reload unbound" \
	  >> ${FAKE_ROOT}/tmp/load-payload-commands

${FAKE_ROOT}/var/www/etc/hosts : www-chroot-hosts
	doas mkdir -p ${FAKE_ROOT}/var/www/etc
	doas chown root.wheel ${FAKE_ROOT}/var/www/etc
	doas chmod 755 ${FAKE_ROOT}/var/www/etc
	doas install -o root -g wheel -m 0644 \
	  www-chroot-hosts ${FAKE_ROOT}/var/www/etc/hosts

${FAKE_ROOT}/var/www/htdocs/pfstat/index.html : pfstat-index.html
	doas mkdir -p ${FAKE_ROOT}/var/www/htdocs/pfstat
	doas chown -R sysop.wheel ${FAKE_ROOT}/var/www/htdocs/pfstat
	doas chmod 755 ${FAKE_ROOT}/var/www/htdocs/pfstat
	doas install -o root -g daemon -m 0644 \
	  pfstat-index.html ${FAKE_ROOT}/var/www/htdocs/pfstat/index.html

${FAKE_ROOT}/var/www/htdocs/pfstat/solarized-dark.min.css : solarized-dark.min.css
	doas install -o root -g daemon -m 0644 \
	  solarized-dark.min.css ${FAKE_ROOT}/var/www/htdocs/pfstat/solarized-dark.min.css

${FAKE_ROOT}/tmp/load-payload.sh : ${FAKE_ROOT}/tmp/load-payload-commands
	echo "set -e" > ${FAKE_ROOT}/tmp/load-payload.sh
	doas sort -u -o ${FAKE_ROOT}/tmp/load-payload.sh ${FAKE_ROOT}/tmp/load-payload-commands

${FAKE_ROOT}/tmp/test-payload.sh : ${FAKE_ROOT}/tmp/test-payload-commands
	echo "set -e" > ${FAKE_ROOT}/tmp/test-payload.sh
	doas sort -u -o ${FAKE_ROOT}/tmp/test-payload.sh ${FAKE_ROOT}/tmp/test-payload-commands

# This tar invocation is goofy because we really don't want to archive
# the directories themselves, with goofy ownership and permissions.
payload: sietchtabr sietchtabr-payload.tgz

sietchtabr-payload.tgz: sietchtabr ${FAKE_ROOT}/tmp/load-payload.sh ${FAKE_ROOT}/tmp/test-payload.sh
	cd ${FAKE_ROOT}; doas find ./ -type f -print0 | xargs -0 doas tar -cpzf ../sietchtabr-payload.tgz

test-payload: payload
	./deploy-and-test-payload.sh

load-payload: payload
	./load-payload.sh

clean : 
	doas rm -rf ${FAKE_ROOT}
	doas rm -rf sietchtabr-payload.tgz

