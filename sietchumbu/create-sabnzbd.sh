docker run \
  -d \
  --name sabnzbd \
  --restart always \
  -e PUID="501" \
  -e PGID="100" \
  -p 8080:8080 \
  -v /home/multi/sabnzbd-config:/config \
  -v /home/multi:/multi \
  hotio/sabnzbd
