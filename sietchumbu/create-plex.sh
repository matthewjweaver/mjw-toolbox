docker run \
  -d \
  --restart \
  --name plex \
  --network=host \
  -e TZ="UTC" \
  -e PLEX_UID="501" \
  -e PLEX_GID="100" \
  -e PLEX_CLAIM="XXXLOLXXX" \
  -v /home/mistakenot/plex-meta/config:/config \
  -v /home/mistakenot/plex-meta/transcode:/transcode \
  -v /home/mistakenot:/mistakenot \
  -v /home/multi:/multi \
  --device=/dev/dri:/dev/dri \
  plexinc/pms-docker
