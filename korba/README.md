# korba setup

This is roughly everything unique to the configuration of the machine
that serves ice-nine.org, mjw.wtf, and nodeless.net DNS and HTTPS.


`doas make korba` should install any changes to this repository onto the
machine, with various caveats which are described below.


## HTTPS

Web serving is done with OpenBSD's `httpd`, configured by `httpd.conf`.
TLS certificates are handled by the delightful `acme-client`, which
users LetsEncrypt to generate and renew certificates. You'll find
the configuration for `acme-client` in `acme-client.conf`. Bootstrapping
the client and resulting certificates is well documented in the manual,
so you can just run `man acme-client`.

Certificate renewal is handled automatically by cron, you can see the
relevant one-liner in the local daily cron file, `daily.cron`.
