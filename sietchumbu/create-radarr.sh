#!/bin/sh
CONTAINER=linuxserver/radarr
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
  -v /home/multi/radarr-config:/config \
  -v /home/multi:/multi \
  ${CONTAINER}
docker prune
