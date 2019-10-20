#!/bin/sh

# Picked a moment in time that all data should date from.
# Sun Oct 20 11:10:38 EDT 2019
RRD_EPOCH="1571584238"

# 

# There is a pair of labels on all traffic at the edge of the network,
# named for the host and direction the traffic is travelling.
labels_in="96.73.134.169-in 96.73.134.170-in 96.73.134.171-in 96.73.134.172-in 96.73.134.173-in"
labels_out="96.73.134.169-out 96.73.134.170-out 96.73.134.171-out 96.73.134.172-out 96.73.134.173-out"

# The labels each get eight per-label statistics provided via pfctl(8):
#   evaluations,
#   packets total,
#   bytes total,
#   packets in,
#   bytes in,
#   packets out,
#   bytes out,
#   state creations
# The rules do not create states as of $RRD_EPOCH, so we expect the "in"
# labels to only show packets/bytes in, and so on with the "out" rules.
# State creations should always be 0.
# We create DS and RRAs for them anyway, because it's cheap and who
# knows what the future holds.

for label in $labels_in $labels_out; do
  # We create one RRD per label.
  RRD_CMD="rrdtool create ${label}.rrd"

  # We use rrdcached for a decent permissions story, plus hey
  # scalability is always nice.
  RRD_CMD="${RRD_CMD} -d unix:/var/run/rrd/rrdcached.sock"

  # Assume we'll collect stats at 5Hz, and never miss more than 5
  # seconds of measurement (heartbeat 5s, below).
  RRD_CMD="${RRD_CMD} -b ${RRD_EPOCH} -s 200ms"

  # assume we will never see more than 2m pps, and never measure less
  # than 5 seconds apart. so, 10 million packets each way or 20 million
  # states (and evalutions).
  RRD_CMD="${RRD_CMD} DS:evaluations:ABSOLUTE:5s:0:20000000"
  RRD_CMD="${RRD_CMD} DS:packets_total:ABSOLUTE:5s:0:20000000"
  RRD_CMD="${RRD_CMD} DS:packets_in:ABSOLUTE:5s:0:10000000"
  RRD_CMD="${RRD_CMD} DS:packets_out:ABSOLUTE:5s:0:10000000"
  RRD_CMD="${RRD_CMD} DS:state_creations:ABSOLUTE:5s:0:20000000"

  # assume we will never be > 1Gbps, never measure less than 5 seconds
  # apart: 5 gigabits = 6.25e+08 bytes
  RRD_CMD="${RRD_CMD} DS:bytes_total:ABSOLUTE:5s:0:625000000"
  RRD_CMD="${RRD_CMD} DS:bytes_in:ABSOLUTE:5s:0:625000000"
  RRD_CMD="${RRD_CMD} DS:bytes_out:ABSOLUTE:5s:0:625000000"

  # keep full resolution for 1 week
  # keep secondly resolution for 28 days
  # keep minutely resolution for 1 years
  # keep hourly resolution for 8 years
  # keep 12-hourly resolution for 32 years
  RRD_CMD="${RRD_CMD} RRA:AVERAGE:0.5:200ms:432000"
  RRD_CMD="${RRD_CMD} RRA:AVERAGE:0.5:1:2419200"
  RRD_CMD="${RRD_CMD} RRA:AVERAGE:0.5:60:525600"
  RRD_CMD="${RRD_CMD} RRA:AVERAGE:0.5:3600:8760"
  RRD_CMD="${RRD_CMD} RRA:AVERAGE:0.5:43200:23360"

  time ${RRD_CMD}
done
