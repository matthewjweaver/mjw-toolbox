# layeraleph.com digital hq

This is roughly everything unique to the configuration of the machine
that serves layeraleph's DNS, HTTPS, along with providing reasonably
safe home directories to layeraleph users.


`doas make hq` should install any changes to this repository onto the
machine, with various caveats which are described below.


## DNSSEC

DNSSEC bootstrapping is described in the text file starting with
`/usr/local/share/doc/pkg-readmes/opendnssec`, after `pkg_add
opendnssec` has been run as root.


The relevant config files are `conf.xml`, `kasp.xml`, and `softhsm.conf`
for `opendnssec`, which is the software suite that manages the keys and
signs the zones.  You'll need to manually enter the softhsm "user" PIN
into `/etc/opendnssec/conf.xml` after a `doas make hq`, since we don't
keep secrets in the git repository.


OpenBSD's authoritative name server, `nsd`, is what actually serves the
signed zones. Its config file is here as `nsd.conf`.


