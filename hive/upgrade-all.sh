#!/bin/sh
./create-homeassistant.sh
./create-plex.sh
./create-radarr.sh
./create-sabnzbd.sh
./create-sonarr.sh
docker system prune
