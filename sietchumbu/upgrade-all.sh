#!/bin/sh
./create-plex.sh
./create-radarr.sh
./create-resilio.sh
./create-sabnzbd.sh
./create-sonarr.sh
docker system prune
