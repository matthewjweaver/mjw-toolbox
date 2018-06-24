.DEFAULT = all

all: /var/www/OpenBSD/6.3/amd64/site63-korba.tgz \
  /var/www/htdocs/korba-install.conf

/var/www/htdocs/korba-install.conf : korba-install.conf
	install -o sysop -g daemon -m 0644 \
	  korba-install.conf /var/www/htdocs/korba-install.conf

/var/www/OpenBSD/6.3/amd64/site63-korba.tgz : site63-korba.tgz
	install -o sysop -g daemon -m 0644 \
	  site63-korba.tgz /var/www/OpenBSD/6.3/amd64/site63-korba.tgz

site63-korba.tgz : etc/acme-client.conf etc/httpd.conf etc/ntpd.conf \
  etc/pf.conf etc/ssh/ssh_config etc/ssh/sshd_config
	tar -cpvzf site63-korba.tgz etc

etc/acme-client.conf : acme-client.conf
	mkdir -p etc
	install -o root -g wheel -m 0644 \
	  acme-client.conf etc/acme-client.conf

etc/httpd.conf : httpd.conf
	mkdir -p etc
	install -o root -g wheel -m 0644 \
	  httpd.conf etc/httpd.conf

etc/ntpd.conf : ntpd.conf
	mkdir -p etc
	install -o root -g wheel -m 0644 \
	  ntpd.conf etc/ntpd.conf

etc/pf.conf : pf.conf
	mkdir -p etc
	install -o root -g wheel -m 0600 \
	  pf.conf etc/pf.conf

etc/ssh/ssh_config : ../../openbsd-skel/ssh_config
	mkdir -p etc/ssh
	install -o root -g wheel -m 0644 \
	  ../../openbsd-skel/ssh_config etc/ssh/ssh_config

etc/ssh/sshd_config : ../../openbsd-skel/sshd_config
	mkdir -p etc/ssh
	install -o root -g wheel -m 0644 \
	  ../../openbsd-skel/sshd_config etc/ssh/sshd_config

