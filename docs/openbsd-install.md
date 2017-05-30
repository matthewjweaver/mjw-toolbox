# OpenBSD fresh install checklist


This checklist produces an openbsd server with a minimized surface area. It only accepts ssh traffic inbound. Inbound ssh may only authenticate with public/private keypairs. The ssh configuration is minimized to a small set of suspected-good key exchange methods and crypto suites. The server recursively resolves DNS names over outbound TLS only, round-robin switching by query across a few providers.


1. Retrieve installation image
    * `# for f in install61.fs SHA256.sig install61.fs; do ftp https://ftp.openbsd.org/pub/OpenBSD/6.1/amd64/${f}; done`
1. Check installation image signature
    * `# signify -C -p /etc/signify/openbsd-61-base.pub -x SHA256.sig | grep install61.fs`
1. Write installation image to media
    * `# dd if=install61.fs of=/dev/rsd2c bs=1m`
1. Reboot to installation media and select (S)hell
1. [Create crypto volume](https://openbsd.org/faq/faq14.html#softraidFDE)
    * `# dd if=/dev/random of=/dev/rsd0c bs=1m`
    * `# fdisk -iy sd0`
    * `# disklabel -E sd0`
    * `# bioctl -c C -l sd0a softraid0`
    * `# cd /dev && sh MAKEDEV sd1 sd2`
    * `# dd if=/dev/zero of=/dev/rsd2c bs=1m count=1`
    * `# exit`
1. Complete installation, using package sets on disk
1. `# chroot /mnt sh -l`
1. ssh/sshd configs
    * `# cd /etc/ssh && ftp https://raw.githubusercontent.com/matthewjweaver/mjw-toolbox/master/openbsd-skel/sshd_config`
    * `# cd /etc/ssh && ftp https://raw.githubusercontent.com/matthewjweaver/mjw-toolbox/master/openbsd-skel/ssh_config`
1. sshd keys
    * `# cd /etc/ssh && rm ssh_host_*key*`
    * `# ssh-keygen -t ed25519 -f ssh_host_ed25519_key < /dev/null`
    * `# ssh-keygen -t rsa -b 4096 -f ssh_host_rsa_key < /dev/null`
1. doas config
    * `# echo 'permit nopass setenv { -ENV SSH_AUTH_SOCK PKG_PATH } :wheel' > /etc/doas.conf`
1. pf.conf
    * `# cd /etc && ftp https://raw.githubusercontent.com/matthewjweaver/mjw-toolbox/master/openbsd-skel/pf.conf`
1. configure unbound
    * `# cd /var/unbound/etc && ftp https://raw.githubusercontent.com/matthewjweaver/mjw-toolbox/master/openbsd-skel/unbound.conf`
    * `# echo 'nameserver 127.0.0.1 >> /etc/resolv.conf'`
    * `# rcctl enable unbound`
1. dhclient DNS override
    * `# echo 'supersede domain-name-servers 127.0.0.1;' > /etc/dhclient.conf`
    * `# echo 'supersede domain-name "my.domain";
1. configure ntpd
    * `# rcctl enable ntpd`
    * `# rcctl set ntpd flags -s`
1. apply patches
    * `# doas syspatch`
1. reboot
