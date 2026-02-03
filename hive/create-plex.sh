#!/bin/sh
# If running for the first time, include the plex claim token:
#  -e PLEX_CLAIM="XXXLOLXXX" \

# doas adduser -h /home/plex -D -u 5001 plex

if [ $(hostname) != taqwa ]; then
  exit 1
fi

CONTAINER=ghcr.io/linuxserver/plex:latest
docker stop plex
docker rm plex
docker pull ${CONTAINER}
docker run \
  -d \
  --name plex \
  --network=host \
  --restart always \
  -e ADVERTISE_IP='http://192.168.223.10:32400/' \
  -e ALLOWED_NETWORKS='192.168.223.0/24,10.42.0.0/16' \
  -e TZ="Etc/UTC" \
  -e PUID="5001" \
  -e PGID="100" \
  -v /volume1/plex-config:/config \
  -v /volume1/mistakenot:/mistakenot \
  -v /volume1/multi:/multi \
  -v /volume2/shadowhax-movies:/shadowhax-movies \
  -v /tmp:/transcode \
  ${CONTAINER}

if [ "$1" = "--prune" ]; then
  docker system prune
fi
