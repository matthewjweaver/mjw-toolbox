# The Whole Yak: A modular-ish approach to pf configuration

## Overview

1. Settings/Definitions
    1. PF settings
    1. Table definitions
    1. Queue definitions
1. Essentials
    1. Uplink packet normalization
    1. Global blocking
    1. Autoconfiguration
        1. DHCP
        1. SLAAC
        1. DHCP6
    1. Outbound DNS traffic (unbound user)
    1. Outbound admin traffic (sysop+root user)
    1. Outbound NTP traffic (ntp user)
    1. Filesystem traffic (NFS towards fileshare)
1. Router-hosted services
    1. SSH
    1. HTTPS
    1. DNS (towards LAN)
    1. NTP (towards LAN)
1. VPNs (loaded later)
    1. IKE
    1. IPSEC
        1. GRE
    1. Wireguard
1. LANs (loaded later)
    1. Capture DNS
    1. NAT outbound
    1. Restrict traffic where needed
1. LAN-based service endpoints (loaded later)

## How it works

Only essential rules are in the main pf.conf, along with a set of
anchors for the other rules.

After a pf.conf load, which should always work, router-based services
(including ssh) are available.

The additional rulesets are loaded via rc.local, after the network has
otherwise spun up. Among other things, it means these rules may depend
on hostname resolution.

