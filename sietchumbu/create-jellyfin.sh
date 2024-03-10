#!/bin/sh

CONTAINER=jellyfin/jellyfin
docker stop jellyfin
docker rm jellyfin
docker pull ${CONTAINER}
docker run \
  -d \
  --device=/dev/dri:/dev/dri \
  --name jellyfin \
  --user 501:100 \
  --network=host \
  --restart always \
  -e JELLYFIN_PublishedServerUrl="http://sietchumbu.weaver.tpl" \
  -v /home/docker/jellyfin/config:/config \
  -v /home/docker/jellyfin/cache:/cache \
  -v /home/mistakenot:/media,readonly \
  -v /home/multi:/media2,readonly \
  -v /home/shadowhax-movies:/media3,readonly \
  ${CONTAINER}

if [ "$1" = "--prune" ]; then
  docker system prune
fi
