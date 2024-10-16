#!/bin/sh

# Picked a moment in time that all data must be after.
# Sun Oct 20 11:10:38 EDT 2019
RRD_EPOCH="1571584238"

# This script has two assumptions about pf rules:
#   1. There are a pair of labels on all traffic at the edge of the
#      network, named for the host and direction the traffic is
#      travelling. For example: 192.168.1.1-in and 192.168.1.1-out
#   2. The pf rules with these labels are set "no state"

# The labels each get eight per-label statistics provided via pfctl(8):
#   evaluations,
#   packets total,
#   bytes total,
#   packets in,
#   bytes in,
#   packets out,
#   bytes out,
#   state creations

# The rules do not create states, so we expect the "in" labels to only
# show packets/bytes in, and so on with the "out" rules.
# Also, State creations should always be 0.
# We create DS and RRAs for them anyway, because it's cheap and who
# knows what the future holds.

for label in $(pfctl -s label|cut -d ' ' -f 1); do
  # We create one RRD per label.
  ofile="/var/db/rrd/${label}.rrd"
  if [ -f $ofile ]; then
    echo "Skipping ${ofile}; already exists"
    continue
  fi
  RRD_CMD="rrdtool create ${ofile}"
  if [ -f ${ofile} ]; then
    RRD_CMD="${RRD_CMD} -r ${ofile}"
  fi

  # We use rrdcached for a decent permissions story, plus hey
  # scalability is always nice.
  RRD_CMD="${RRD_CMD} -d unix:/var/run/rrd/rrdcached.sock"

  # Assume we'll collect stats at 1Hz, and never miss more than 5
  # seconds of measurement (heartbeat 5s on DS lines, below).
  RRD_CMD="${RRD_CMD} -b ${RRD_EPOCH} -s 1"

  # Assume we will never see more than 2m pps, and never measure less
  # than 5 seconds apart. so, 10 million packets each way or 20 million
  # states (and evalutions).

  # Assume we will never be > 1Gbps, never measure less than 5 seconds
  # apart: 5 gigabits = 6.25e+08 bytes

  # DS are created in the order pfctl outputs them, for ease of
  # updating.
  RRD_CMD="${RRD_CMD} DS:evaluations:ABSOLUTE:5s:0:20000000"
  RRD_CMD="${RRD_CMD} DS:packets_total:ABSOLUTE:5s:0:20000000"
  RRD_CMD="${RRD_CMD} DS:bytes_total:ABSOLUTE:5s:0:625000000"
  RRD_CMD="${RRD_CMD} DS:packets_in:ABSOLUTE:5s:0:10000000"
  RRD_CMD="${RRD_CMD} DS:bytes_in:ABSOLUTE:5s:0:625000000"
  RRD_CMD="${RRD_CMD} DS:packets_out:ABSOLUTE:5s:0:10000000"
  RRD_CMD="${RRD_CMD} DS:bytes_out:ABSOLUTE:5s:0:625000000"
  RRD_CMD="${RRD_CMD} DS:state_creations:ABSOLUTE:5s:0:20000000"

  # keep secondly resolution for 28 days
  # keep minutely resolution for 1 years
  # keep hourly resolution for 8 years
  # keep 12-hourly resolution for 32 years
  RRD_CMD="${RRD_CMD} RRA:AVERAGE:0.5:1:28d"
  RRD_CMD="${RRD_CMD} RRA:AVERAGE:0.5:60:2y"
  RRD_CMD="${RRD_CMD} RRA:AVERAGE:0.5:3600:8y"
  RRD_CMD="${RRD_CMD} RRA:AVERAGE:0.5:43200:32y"

  time ${RRD_CMD}
done
