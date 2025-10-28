#!/bin/sh
CONTAINER=ghcr.io/linuxserver/sabnzbd:latest

if [ $(hostname) != un.hive.here ]; then
  exit 1
fi

if [ ! -d /multi ]; then
  mkdir /multi
  echo "check fstab for nfs mounts!"
  exit 1
fi
if [ ! -d /home/inbound/complete ]; then
  mkdir -p /home/inbound/complete
  chown -R 501 /home/inbound/complete
fi
if [ ! -d /home/inbound/incomplete ]; then
  mkdir -p /home/inbound/incomplete
  chown -R 501 /home/inbound/incomplete
fi

docker stop sabnzbd
docker rm sabnzbd
docker pull ${CONTAINER}
docker run \
  -d \
  --name sabnzbd \
  --restart always \
  -e PUID="501" \
  -e PGID="100" \
  -p 8080:8080 \
  -v /home/sabnzbd:/config \
  -v /home/inbound/incomplete:/incomplete-downloads \
  -v /home/inbound/complete:/downloads \
  -v /multi:/multi \
  ${CONTAINER}

if [ "$1" = "--prune" ]; then
  docker system prune
fi
