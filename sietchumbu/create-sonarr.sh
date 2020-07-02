#!/bin/sh
CONTAINER=linuxserver/sonarr
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
  -v /home/multi/sonarr-config:/config \
  -v /home/multi:/multi \
  ${CONTAINER}
docker prune
