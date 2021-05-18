sietchumbu: \
  /etc/chrony/chrony.conf \
  /etc/conf.d/syslog \
  /etc/munin/munin-node.conf \
  /etc/sudoers \
  /etc/sysctl.conf

/etc/conf.d/syslog : syslog
	install -o root -g root -m 0644 \
	syslog /etc/conf.d/syslog

/etc/chrony/chrony.conf : chrony.conf
	install -o root -g root -m 0644 \
	chrony.conf /etc/chrony/chrony.conf

/etc/munin/munin-node.conf : munin-node.conf
	install -o root -g root -m 0644 \
	munin-node.conf /etc/munin/munin-node.conf

/etc/network/interfaces : interfaces
	install -o root -g root -m 0644 \
	interfaces /etc/network/interfaces

/etc/sudoers : sudoers
	install -o root -g root -m 0440 \
	sudoers /etc/sudoers

/etc/sysctl.conf : sysctl.conf
	install -o root -g root -m 0440 \
	sysctl.conf /etc/sysctl.conf

