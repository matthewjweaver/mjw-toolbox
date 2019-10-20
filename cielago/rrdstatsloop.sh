#!/bin/sh
while sleep 0.2; do
  doas /home/sysop/bin/rrdupdate.sh > /dev/null | \
    /usr/bin/logger -cf - -t rrdstats
done
