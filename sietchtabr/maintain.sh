#!/bin/sh
for uh in $(cat /home/sysop/.nodeless ); do
  ssh ${uh} hostname;
done
echo "press enter to continue" ; read trash
for uh in $(cat /home/sysop/.nodeless ); do
  ssh ${uh} "doas syspatch; if grep -q opendnssec /etc/group; then doas chown _opendnssec /var/nsd/zones/master; fi" &
done;
wait
echo "press enter to continue" ; read trash
for uh in $(cat /home/sysop/.nodeless ); do
  ssh ${uh} "if [ -d /var/nsd/zones/master ]; then ls -la /var/nsd/zones/master; fi";
done
echo "press enter to continue" ; read trash
for uh in $(cat /home/sysop/.nodeless ); do
  ssh ${uh} mail
done
tail -80 /var/log/daemon | less
echo "press enter to continue" ; read trash
tail -80 /var/log/messages | less
echo "press enter to continue" ; read trash

#for uh in $(head -2 /home/sysop/.nodeless ); do ssh ${uh} "doas reboot" & done; wait
#for uh in $(cat /home/sysop/.nodeless ); do ssh ${uh} doas rcctl restart syslogd; done
