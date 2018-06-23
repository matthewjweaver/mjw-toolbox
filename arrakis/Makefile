.DEFAULT : all

all: /etc/hostname.bridge0 /etc/hostname.bridge1 /etc/hostname.em0 \
  /etc/hostname.em1 /etc/hostname.em2 /etc/hostname.vether0 \
  /etc/hostname.vether1 /etc/pf.conf /etc/sysctl.conf \
  /var/unbound/etc/unbound.conf

/etc/hostname.bridge0 : hostname.bridge0
	install -o root -g wheel -m 0640 \
	  hostname.bridge0 /etc/hostname.bridge0

/etc/hostname.bridge1 : hostname.bridge1
	install -o root -g wheel -m 0640 \
	  hostname.bridge1 /etc/hostname.bridge1

/etc/hostname.em0 : hostname.em0
	install -o root -g wheel -m 0640 \
	  hostname.em0 /etc/hostname.em0

/etc/hostname.em1 : hostname.em1
	install -o root -g wheel -m 0640 \
	  hostname.em1 /etc/hostname.em1

/etc/hostname.em2 : hostname.em2
	install -o root -g wheel -m 0640 \
	  hostname.em2 /etc/hostname.em2

/etc/hostname.vether0 : hostname.vether0
	install -o root -g wheel -m 0640 \
	  hostname.vether0 /etc/hostname.vether0

/etc/hostname.vether1 : hostname.vether1
	install -o root -g wheel -m 0640 \
	  hostname.vether1 /etc/hostname.vether1


/etc/pf.conf : pf.conf
	install -o root -g wheel -m 0600 \
	  pf.conf /etc/pf.conf

/etc/sysctl.conf : sysctl.conf
	install -o root -g wheel -m 0640 \
	  sysctl.conf /etc/sysctl.conf

/var/unbound/etc/unbound.conf : unbound.conf
	install -o root -g _unbound -m 0640 \
	  unbound.conf /var/unbound/etc/unbound.conf

