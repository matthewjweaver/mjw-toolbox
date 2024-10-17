#!/bin/sh

# Manually added packages necessary for this machine

export PKG_PATH=https://sietchtabr.nodeless.net/%m
doas pkg_add \
  aggregate \
  dhcpcd \
  git \
  gitwrapper \
  gnupg \
  iperf \
  iperf3 \
  libgpg \
  munin-node \
  munin-server \
  netpbm \
  nmap \
  nfsen \
  openvpn \
  pfstat \
  pftop \
  reposync \
  rsync \
  smokeping \
  sysclean \
  unzip \
  vim \
  wget \
  zip
