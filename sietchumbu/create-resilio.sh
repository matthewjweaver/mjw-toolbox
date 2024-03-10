#!/bin/sh
CONTAINER=resilio/sync
docker stop resilio
docker rm resilio
docker pull ${CONTAINER}
docker run \
  -d \
  --name resilio \
  --restart always \
  -e PUID="501" \
  -e PGID="100" \
  -p 8888:8888 \
  -p 55555:55555 \
  -v /home/docker/resilio-meta:/mnt/sync \
  -v /home/mistakenot:/mnt/mounted_folders/mistakenot \
  -v /home/multi:/mnt/mounted_folders/multi \
  -v /home/shadowhax-movies:/mnt/mounted_folders/shadowhax-movies \
  ${CONTAINER}

if [ "$1" = "--prune" ]; then
  docker system prune
fi
