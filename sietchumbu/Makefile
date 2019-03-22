sietchumbu: \
  /etc/dhcpd.conf \
  /etc/doas.conf \
  /etc/hostname.bridge0 \
  /etc/hostname.em0 \
  /etc/hostname.em1 \
  /etc/hostname.em2 \
  /etc/hostname.em3 \
  /etc/hostname.vether0 \
  /etc/ipsec.conf \
  /etc/mygate \
  /etc/npppd/npppd-users \
  /etc/ntpd.conf \
  /etc/pf.conf \
  /etc/resolv.conf \
  /etc/sysctl.conf

/etc/dhcpd.conf : dhcpd.conf
	install -o root -g wheel -m 0644 \
	  dhcpd.conf /etc/dhcpd.conf

/etc/doas.conf : ../openbsd-skel/doas.conf
	install -o root -g wheel -m 0600 \
	  ../openbsd-skel/doas.conf /etc/doas.conf

/etc/hostname.bridge0 : hostname.bridge0
	install -o root -g wheel -m 0640 \
	  hostname.bridge0 /etc/hostname.bridge0

/etc/hostname.em0 : hostname.em0
	install -o root -g wheel -m 0640 \
	  hostname.em0 /etc/hostname.em0

/etc/hostname.em1 : hostname.em1
	install -o root -g wheel -m 0640 \
	  hostname.em1 /etc/hostname.em1

/etc/hostname.em2 : hostname.em2
	install -o root -g wheel -m 0640 \
	  hostname.em2 /etc/hostname.em2

/etc/hostname.em3 : hostname.em3
	install -o root -g wheel -m 0640 \
	  hostname.em3 /etc/hostname.em3

/etc/hostname.vether0 : hostname.vether0
	install -o root -g wheel -m 0640 \
	  hostname.vether0 /etc/hostname.vether0

/etc/ipsec.conf : ipsec.conf
	install -o root -g wheel -m 0600 \
	  ipsec.conf /etc/ipsec.conf

/etc/mygate : mygate
	install -o root -g wheel -m 0644 \
	  ntpd.conf /etc/mygate

/etc/npppd/npppd-users : npppd-users
	install -o root -g wheel -m 0600 \
	  npppd-users /etc/npppd/npppd-users

/etc/ntpd.conf : ntpd.conf
	install -o root -g wheel -m 0644 \
	  ntpd.conf /etc/ntpd.conf

/etc/pf.conf : pf.conf
	install -o root -g wheel -m 0600 \
	  pf.conf /etc/pf.conf

/etc/resolv.conf : resolv.conf
	install -o root -g wheel -m 0644 \
	  resolv.conf /etc/resolv.conf

/etc/ssh/ssh_config : ../openbsd-skel/ssh_config
	install -o root -g wheel -m 0644 \
	  ../openbsd-skel/ssh_config /etc/ssh/ssh_config

/etc/ssh/sshd_config : ../openbsd-skel/sshd_config
	install -o root -g wheel -m 0644 \
	  ../openbsd-skel/sshd_config /etc/ssh/sshd_config

/etc/sysctl.conf : sysctl.conf
	install -o root -g wheel -m 0644 \
	  sysctl.conf /etc/sysctl.conf

