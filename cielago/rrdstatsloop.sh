#!/bin/sh
while sleep 2; do
  doas /home/sysop/bin/rrdupdate.sh | 2>&1 \
    /usr/bin/logger -ct rrdstats
done
