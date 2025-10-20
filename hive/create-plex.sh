#!/bin/sh
# If running for the first time, include the plex claim token:
#  -e PLEX_CLAIM="XXXLOLXXX" \

CONTAINER=ghcr.io/linuxserver/plex:latest
docker stop plex
docker rm plex
docker pull ${CONTAINER}
docker run \
  -d \
 --device=/dev/dri:/dev/dri \
  --name plex \
  --network=host \
  --restart always \
  -e ADVERTISE_IP='http://10.42.1.22:32400/,http://192.168.223.22:32400/' \
  -e ALLOWED_NETWORKS='192.168.223.0/24,10.42.0.0/16' \
  -e TZ="Etc/UTC" \
  -e PUID="501" \
  -e PGID="100" \
  -v /home/docker/plex-meta/config:/config \
  -v /home/mistakenot:/mistakenot \
  -v /home/multi:/multi \
  -v /home/shadowhax-movies:/shadowhax-movies \
  -v /home/docker/plex-tmp:/transcode \
  ${CONTAINER}

if [ "$1" = "--prune" ]; then
  docker system prune
fi
