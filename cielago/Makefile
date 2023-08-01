cielago: \
  /etc/doas.conf \
  /etc/hostname.bridge0 \
  /etc/hostname.em0 \
  /etc/hostname.em1 \
  /etc/hostname.em3 \
  /etc/httpd.conf \
  /etc/munin/munin-node.conf \
  /etc/newsyslog.conf \
  /etc/ntpd.conf \
  /etc/pf.conf \
  /etc/pf.sshbots \
  /etc/pfstat.conf \
  /etc/ssh/ssh_config \
  /etc/ssh/sshd_config \
  /etc/sysctl.conf \
  /etc/syslog.conf \
  /home/sysop/bin/rrdgraph.sh \
  /home/sysop/bin/rrdstatsloop.sh \
  /home/sysop/bin/rrdupdate.sh \
  /usr/local/libexec/munin/plugins/sensors_ \
  /var/www/htdocs/pf/nodeless.html \
  /var/www/htdocs/pf/pfstat.html \
  /var/www/htdocs/pf/solarized-dark.min.css

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

/etc/hostname.em3 : hostname.em3
	doas install -o root -g wheel -m 0640 \
	  hostname.em3 /etc/hostname.em3

/etc/httpd.conf : httpd.conf
	doas install -o root -g wheel -m 0644 \
	  httpd.conf /etc/httpd.conf

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
	doas pfctl -nf pf.conf
	doas install -o root -g wheel -m 0600 \
	  pf.conf /etc/pf.conf
	doas pfctl -f /etc/pf.conf

/etc/pf.sshbots : ../openbsd-skel/pf.sshbots
	doas install -o root -g wheel -m 0600 \
	  ../openbsd-skel/pf.sshbots /etc/pf.sshbots

/etc/pfstat.conf : pfstat.conf
	doas install -o root -g wheel -m 0644 \
	  pfstat.conf /etc/pfstat.conf

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

/home/sysop/bin/rrdgraph.sh : rrdgraph.sh
	doas install -o sysop -g sysop -m 0750 \
	  rrdgraph.sh /home/sysop/bin/rrdgraph.sh

/home/sysop/bin/rrdstatsloop.sh : rrdstatsloop.sh
	doas install -o sysop -g sysop -m 0750 \
	  rrdstatsloop.sh /home/sysop/bin/rrdstatsloop.sh

/home/sysop/bin/rrdupdate.sh : rrdupdate.sh
	doas install -o sysop -g sysop -m 0750 \
	  rrdupdate.sh /home/sysop/bin/rrdupdate.sh

/usr/local/libexec/munin/plugins/sensors_ : sensors_
	doas install -o root -g bin -m 0755 \
	  sensors_ /usr/local/libexec/munin/plugins/sensors_

/var/www/htdocs/pf/nodeless.html : htdocs/pf/nodeless.html
	doas mkdir -p /var/www/htdocs/pf
	doas chown -R sysop.wheel /var/www/htdocs/pf
	doas chmod 755 /var/www/htdocs/pf
	doas install -o sysop -g wheel -m 0644 \
	htdocs/pf/nodeless.html /var/www/htdocs/pf/nodeless.html

/var/www/htdocs/pf/pfstat.html : htdocs/pf/pfstat.html
	doas mkdir -p /var/www/htdocs/pf
	doas chown -R sysop.wheel /var/www/htdocs/pf
	doas chmod 755 /var/www/htdocs/pf
	doas install -o sysop -g wheel -m 0644 \
	htdocs/pf/pfstat.html /var/www/htdocs/pf/pfstat.html

/var/www/htdocs/pf/solarized-dark.min.css : htdocs/pf/solarized-dark.min.css
	doas mkdir -p /var/www/htdocs/pf
	doas chown -R sysop.wheel /var/www/htdocs/pf
	doas chmod 755 /var/www/htdocs/pf
	doas install -o sysop -g wheel -m 0644 \
	htdocs/pf/solarized-dark.min.css /var/www/htdocs/pf/solarized-dark.min.css 
