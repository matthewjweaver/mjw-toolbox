hive: \
  /etc/ssh/sshd_config \
  /etc/ssh/ssh_config

/etc/ssh/ssh_config : ../openbsd-skel/ssh_config
	cp ../openbsd-skel/ssh_config /etc/ssh/ssh_config
	chown root:root /etc/ssh/ssh_config
	chmod 644 /etc/ssh/ssh_config

/etc/ssh/sshd_config : ../openbsd-skel/sshd_config
	cp ../openbsd-skel/sshd_config /etc/ssh/sshd_config
	chown root:root /etc/ssh/sshd_config
	chmod 644 /etc/ssh/sshd_config

