#!/bin/sh
CONTAINER=ghcr.io/linuxserver/sonarr:latest
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
  -v /home/docker/sonarr-config:/config \
  -v /home/multi:/multi \
  -v /home/docker/inbound/complete:/downloads \
  ${CONTAINER}

if [ "$1" = "--prune" ]; then
  docker system prune
fi
