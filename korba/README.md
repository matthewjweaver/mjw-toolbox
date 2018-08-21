# korba setup

This is roughly everything unique to the configuration of the machine
that serves ice-nine.org, mjw.wtf, and nodeless.net DNS and HTTPS.


`doas make korba` should install any changes to this repository onto the
machine, with various caveats which are described below.


## DNSSEC

DNSSEC bootstrapping is described in the text file starting with
`/usr/local/share/doc/pkg-readmes/opendnssec`, after `pkg_add
opendnssec` has been run as root.


The relevant config files are `conf.xml`, `kasp.xml`, and `softhsm.conf`
for `opendnssec`, which is the software suite that manages the keys and
signs the zones.  OpenBSD's authoritative name server, `nsd`, is what
actually serves the signed zones. Its config file is here as `nsd.conf`.

On bootstrap, after the package installs, a few things must be done by
hand.

1. `# doas rm -rf /var/opendnssec/signed`
1. `# doas ln -s /var/nsd/zones/master /var/opendnssec/signed`
1. `# doas chown _opendnssec /var/nsd/zones/master`
1. `# doas usermod -G _nsd opendnssec`


### caveats about build
1. You'll need to manually enter the softhsm "user" PIN
into `/etc/opendnssec/conf.xml` after a `doas make korba`, since we don't
keep secrets in the git repository.


## HTTPS

Web serving is done with OpenBSD's `httpd`, configured by `httpd.conf`.
TLS certificates are handled by the delightful `acme-client`, which
users LetsEncrypt to generate and renew certificates. You'll find
the configuration for `acme-client` in `acme-client.conf`. Bootstrapping
the client and resulting certificates is well documented in the manual,
so you can just run `man acme-client`.

Certificate renewal is handled automatically by cron, you can see the
relevant one-liner in the local daily cron file, `daily.cron`.
