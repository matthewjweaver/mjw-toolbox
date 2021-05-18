#!/bin/sh
set -e
if ! hostname|grep sietchtabr; then
  echo "this isn't sietchtabr"
  exit 1
fi
echo CREATING CA
ikectl ca vpn create
echo CREATING SIETCHTABR CERT
ikectl ca vpn certificate sietchtabr.nodeless.net create
ikectl ca vpn install
ikectl ca vpn certificate sietchtabr.nodeless.net install
for h in korba.nodeless.net hq.layeraleph.com; do
  echo CREATING ${h} CERT
  ikectl ca vpn certificate ${h} create
  ikectl ca vpn certificate ${h} install
  ikectl ca vpn certificate ${h} export
  f=${h}.tgz
  if ! [ -f ${f} ]; then
    echo "can't find ${h}'s crt chain"
    exit 1
  fi
  < ${f} \
    ssh -A sysop@${h} "doas tar -C /etc/iked -xzvpf -"
  rm -rf ${f} ${h}.zip
done
