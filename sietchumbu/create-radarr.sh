#!/bin/sh
CONTAINER=ghcr.io/linuxserver/radarr:latest
docker stop radarr
docker rm radarr
docker pull ${CONTAINER}
docker run \
  -d \
  --name radarr \
  --restart always \
  -e PUID="501" \
  -e PGID="100" \
  -p 7878:7878 \
  -v /home/docker/radarr-config:/config \
  -v /home/multi:/multi \
  -v /home/docker/inbound/complete:/downloads \
  ${CONTAINER}

if [ "$1" = "--prune" ]; then
  docker system prune
fi
