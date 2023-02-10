#!/bin/sh
./create-plex.sh
./create-radarr.sh
./create-resilio.sh
./create-sabnzbd.sh
./create-sonarr.sh
./create-homeassistant.sh
docker system prune
