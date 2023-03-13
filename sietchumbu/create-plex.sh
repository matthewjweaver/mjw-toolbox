#!/bin/sh
# If running for the first time, include the plex claim token:
#  -e PLEX_CLAIM="XXXLOLXXX" \
#  --device=/dev/dri:/dev/dri \

CONTAINER=plexinc/pms-docker
docker stop plex
docker rm plex
docker pull ${CONTAINER}
docker run \
  --cpus="4" \
  -d \
  --name plex \
  --network=host \
  --restart always \
  -e ADVERTISE_IP='http://10.42.1.22:32400/,http://192.168.223.22:32400/' \
  -e ALLOWED_NETWORKS='192.168.223.0/24,10.42.0.0/16' \
  -e TZ="UTC" \
  -e PLEX_UID="501" \
  -e PLEX_GID="100" \
  -v /home/docker/plex-meta/config:/config \
  -v /home/mistakenot:/mistakenot \
  -v /home/multi:/multi \
  -v /home/docker/plex-tmp:/transcode \
  ${CONTAINER}

if [ "$1" = "--prune" ]; then
  docker system prune
fi
