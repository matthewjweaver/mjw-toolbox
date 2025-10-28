#!/bin/sh
# If running for the first time, include the plex claim token:
#  -e PLEX_CLAIM="XXXLOLXXX" \


# doas adduser -h /home/plex -D -u 501 plex

if [ $(hostname) != p.hive.here ]; then
  exit 1
fi

if [ ! -d /mistakenot ]; then
  mkdir /mistakenot
  echo "check fstab for nfs mounts!"
  exit 1
fi
if [ ! -d /multi ]; then
  mkdir /multi
  echo "check fstab for nfs mounts!"
  exit 1
fi
if [ ! -d /shadowhax-movies ]; then
  mkdir /shadowhax-movies
  echo "check fstab for nfs mounts!"
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
  -e ADVERTISE_IP='http://192.168.223.41:32400/' \
  -e ALLOWED_NETWORKS='192.168.223.0/24,10.42.0.0/16' \
  -e TZ="Etc/UTC" \
  -e PUID="501" \
  -e PGID="100" \
  -v /home/plex:/config \
  -v /mistakenot:/mistakenot \
  -v /multi:/multi \
  -v /shadowhax-movies:/shadowhax-movies \
  -v /tmp:/transcode \
  ${CONTAINER}

if [ "$1" = "--prune" ]; then
  docker system prune
fi
