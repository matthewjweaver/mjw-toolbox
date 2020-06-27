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
  -p 8888 \
  -p 53885 \
  -v /home/mistakenot/resilio-meta:/mnt/sync \
  -v /home/mistakenot:/mnt/mounted_folders/mistakenot \
  -v /home/multi:/mnt/mounted_folders/multi \
  ${CONTAINER}
docker prune
