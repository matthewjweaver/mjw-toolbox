#!/bin/sh
CONTAINER=ghcr.io/linuxserver/resilio-sync:latest
docker stop resilio-sync
docker rm resilio-sync
docker pull ${CONTAINER}
docker run \
  -d \
  --name resilio-sync \
  --restart always \
  -e PUID="501" \
  -e PGID="100" \
  -e UMASK="000" \
  -p 8888:8888 \
  -p 55555:55555 \
  -v /home/docker/resilio-meta/config:/config \
  -v /home/docker/resilio-meta/downloads:/downloads \
  -v /home/mistakenot:/sync/mistakenot \
  -v /home/multi:/sync/multi \
  -v /home/shadowhax-movies:/sync/shadowhax-movies \
  ${CONTAINER}

if [ "$1" = "--prune" ]; then
  docker system prune
fi
