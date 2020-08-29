# Basic OpenBSD customization files

## doas.conf

This configuration for doas(1) allows anyone in the group wheel to run commands as root without
having to provide a password. Useful if for a setup with a non-root user
as default login.


## dhcpd.conf

Basic dhcpd.conf to configure network clients to use this machine as a
default route and recursive nameserver.


## pf.conf / pf.conf.router

Minimal pf.conf(5) configurations for pf(4). The .router variant has
necessary NAT rules to allow a gateway to NAT outbound traffic from a
local network to the internet on the egress interface.


## pf.sshbots

The pf.sshbots is a persistent table of addresses and netblocks observed
doing funny business to ssh. The pf.conf(5) files will, by default, drop
all traffic from these addresses if this file is placed in
`/etc/pf.sshbots`.


The following set of commands are useful for updating the bad ssh actors
list based on your ssh server logs:
```
# < /var/log/authlog \
  awk '/Invalid user/ {print $10}'| \
  sort -n|uniq|grep -v '[[:alpha:]]'|xargs doas pfctl -t sshbots -T add
# < /var/log/authlog \
  awk '/Disconnected from invalid user/ {print $11}'| \
  sort -n|uniq|grep -v '[[:alpha:]]'|xargs doas pfctl -t sshbots -T add
# < /var/log/authlog \
  awk '/Disconnected from authenticating user/ {print $11}'| \
  sort -n|uniq|grep -v '[[:alpha:]]'|xargs doas pfctl -t sshbots -T add
# < /var/log/authlog \
  awk '/Unable to negotiate/ {print $10}'| \
  sort -n|uniq|grep -v '[[:alpha:]]'|xargs doas pfctl -t sshbots -T add
# doas pfctl -t sshbots -T show > /tmp/t && \
  doas mv /tmp/t /etc/pf.sshbots
```


## ssh_config; sshd_config

Hardened ssh configurations. Based on @stribika's excellent [Secure
Secure
Shell](https://stribika.github.io/2015/01/04/secure-secure-shell.html)
writeup, these configurations do a few things designed to make the
available ssh have as little vulnerable surface area as possible. To
wit, the configs:

- Disallow any authentication except public key
- Restrict key exchange suites to "known good" (nothing we suspect
  advanced attackers or surveillers, with nation-state resources, can
  thwart)
- Restrict message authentication and encryption suites to "known good"
  (nothing we suspect advanced attackers or surveillers, with nation-state
  resources, can thwart)


## unbound.conf

A minimal configuration for a recursive unbound(1) server that transmits
upstream DNS queries only over TLS to a variety of high-reliabiliy,
low-latency providers (such as IBM's 9.9.9.9 servers and Cloudflare's
1.1.1.1 servers). This does give a subset of your DNS query traffic
directly to various known collectors.


