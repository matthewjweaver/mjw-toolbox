#!/bin/sh
set -e
for uh in $(cat /home/sysop/.nodeless ); do
  ssh ${uh} hostname;
done
for uh in $(cat /home/sysop/.nodeless ); do
  ssh ${uh} "doas syspatch; doas pkg_add -u; if grep -q opendnssec /etc/group; then doas chown _opendnssec /var/nsd/zones/master; fi" &
done;
wait
for uh in $(cat /home/sysop/.nodeless ); do
  ssh ${uh} "if [ -d /var/nsd/zones/master ]; then doas ls -la /var/nsd/zones/master; fi";
done
echo "press enter to continue" ; read trash
for uh in $(cat /home/sysop/.nodeless ); do
  ssh ${uh} mail
done
tail -80 /var/log/daemon | less
tail -80 /var/log/messages | less

#for uh in $(head -2 /home/sysop/.nodeless ); do ssh ${uh} "doas reboot" & done; wait
#for uh in $(cat /home/sysop/.nodeless ); do ssh ${uh} doas rcctl restart syslogd; done
