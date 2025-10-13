#!/bin/sh
set -e
user_hosts=$( grep -v '^#' /home/sysop/.nodeless )

for uh in $user_hosts; do
  ssh -4 ${uh} hostname;
done
for uh in $user_hosts; do
  ssh -4 ${uh} "doas syspatch; doas pkg_add -u; if grep -q opendnssec /etc/group; then doas chown _opendnssec /var/nsd/zones/master; fi" &
done;
wait
for uh in $user_hosts; do
  ssh -4 ${uh} "if [ -d /var/nsd/zones/master ]; then doas ls -la /var/nsd/zones/master; fi";
done
echo "press enter to continue" ; read trash
set +e
for uh in $user_hosts; do
  echo "${uh} admin mail : press enter to continue" ; read trash
  ssh -4 ${uh} doas mail
  ssh -4 ${uh} mail
done
#tail -80 /var/log/daemon | less
#tail -80 /var/log/messages | less

#for uh in $(head -2 /home/sysop/.nodeless ); do ssh -4 ${uh} "doas reboot" & done; wait
#for uh in $(cat /home/sysop/.nodeless ); do ssh -4 ${uh} doas rcctl restart syslogd; done
