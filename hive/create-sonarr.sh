#!/bin/sh
CONTAINER=ghcr.io/linuxserver/sonarr:latest

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

docker stop sonarr
docker rm sonarr
docker pull ${CONTAINER}
docker run \
  -d \
  --name sonarr \
  --restart always \
  -e PUID="501" \
  -e PGID="100" \
  -p 8989:8989 \
  -v /home/sonarr:/config \
  -v /multi:/multi \
  -v /home/inbound/complete:/downloads \
  ${CONTAINER}

if [ "$1" = "--prune" ]; then
  docker system prune
fi
