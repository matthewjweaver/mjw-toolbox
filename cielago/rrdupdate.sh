#!/bin/sh
# This script assumes a few things:
#   0. pf labels end with "in" or "out"
#   1. There is an rrd file for each pf label
#   2. The files are named "<label name>.rrd"
#   3. The rrd files were created with the DS sources in the same order
#      as the pfctl -s label output.
#   4. rrdcached is running with the OpenBSD default socket location
#
# 1-3 are easily satisfied by using the rrdcreate.sh file in this
# repository.

NOW=$(date +%s)

# This resets the counters after collecting the stats.
# TODO(anyone): there is probably a more elegant way to do this, without
# creating another sh process.
/sbin/pfctl -zs label |
  sed \
    -e's/ /:/g' \
    -e's%^%rrdtool update /var/db/rrd/%g' \
    -e"s%in:%in.rrd -d unix:/var/run/rrd/rrdcached.sock ${NOW}:%g" \
    -e"s%out:%out.rrd -d unix:/var/run/rrd/rrdcached.sock ${NOW}:%g" |
  /bin/sh &
