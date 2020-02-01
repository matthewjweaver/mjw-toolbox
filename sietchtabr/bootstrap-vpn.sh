#!/bin/sh
set -e
if ! hostname|grep sietchtabr; then
  echo "this isn't sietchtabr"
  exit 1
fi
ikectl ca vpn create
ikectl ca vpn certificate sietchtabr.nodeless.net create
ikectl ca vpn certificate sietchumbu.nodeless.net create
ikectl ca vpn install
ikectl ca vpn certificate sietchtabr.nodeless.net install
ikectl ca vpn certificate sietchumbu.nodeless.net export
if ! [ -f sietchumbu.nodeless.net.tgz ]; then
  echo "can't find siethcumbu's crt chain"
  exit 1
fi
< sietchumbu.nodeless.net.tgz \
  ssh -A sysop@sietchumbu.nodeless.net "doas tar -C /etc/iked -xzvpf -"
rm -rf sietchumbu.nodeless.net.tgz
