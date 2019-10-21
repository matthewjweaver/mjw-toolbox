#!/bin/sh
while sleep 1; do
  doas /home/sysop/bin/rrdupdate.sh | \
    /usr/bin/logger -cf - -t rrdstats
done
