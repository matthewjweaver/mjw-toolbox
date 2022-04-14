#!/bin/sh
# If running for the first time, include the plex claim token:
#  -e PLEX_CLAIM="XXXLOLXXX" \

CONTAINER=plexinc/pms-docker
docker stop plex
docker rm plex
docker pull ${CONTAINER}
docker run \
  --cpus="4" \
  -d \
  --device=/dev/dri:/dev/dri \
  --name plex \
  --network=host \
  --restart always \
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
