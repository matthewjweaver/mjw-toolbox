docker run \
  -d \
  --name sonarr \
  --restart always \
  -e PUID="501" \
  -e PGID="100" \
  -p 8989:8989 \
  -v /home/multi/sonarr-config:/config \
  -v /home/multi:/multi \
  linuxserver/sonarr
