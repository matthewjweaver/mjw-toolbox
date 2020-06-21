docker run \
  -d \
  --name radarr \
  --restart always \
  -e PUID="501" \
  -e PGID="100" \
  -p 7878:7878 \
  -v /home/multi/radarr-config:/config \
  -v /home/multi:/multi \
  linuxserver/radarr
