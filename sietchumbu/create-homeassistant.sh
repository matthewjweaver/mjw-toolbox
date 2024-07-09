#!/bin/sh
CONTAINER=ghcr.io/linuxserver/homeassistant:latest
docker stop homeassistant
docker rm homeassistant
docker pull $CONTAINER
docker run -d \
  --name homeassistant \
  --privileged \
  --restart=unless-stopped \
  -e PUID="30001" \
  -e TZ="America/Chicago" \
  -v /home/docker/homeassistant:/config \
  --network=host \
  ${CONTAINER}

if [ "$1" = "--prune" ]; then
  docker system prune
fi
