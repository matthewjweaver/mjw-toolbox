#!/bin/sh
CONTAINER=ghcr.io/linuxserver/sabnzbd:latest
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
  -v /home/docker/sabnzbd-config:/config \
  -v /home/docker/inbound/incomplete:/incomplete-downloads \
  -v /home/docker/inbound/complete:/downloads \
  -v /home/multi:/multi \
  ${CONTAINER}

if [ "$1" = "--prune" ]; then
  docker system prune
fi
