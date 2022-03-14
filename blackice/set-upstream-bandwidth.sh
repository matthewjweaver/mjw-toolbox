#!/bin/sh

# Usage: '-t' means to test, outputting to /tmp/pf.conf instead of
# /etc/pf.conf.

# These hours are firewall's local timezone
PEAK_START_HOUR="16"
PEAK_END_HOUR="23"

# Cut out only the hour portion of the time
HOUR_NOW=$(date|cut -d ' ' -f 4|cut -d ':' -f 1)

if [ "$1" = "-t" ]; then
  OUTPUT="/tmp/pf.conf"
else
  OUTPUT="/etc/pf.conf"
fi

# The ed operations below find lines which start with:
#   "queue fq on $uplink"
# They then replace any word on that line beginning with:
#   "$upstream_"
# with either $upstream_peak or $upstream_offpeak, depending on the hour
# of the day.
if [ $HOUR_NOW -ge $PEAK_START_HOUR ]; then
  if [ $HOUR_NOW -le $PEAK_END_HOUR ]; then
    # The current hour is inside peak times
    ed -s /etc/pf.conf << EOF
/^queue fq on [$]uplink/s/[$]upstream_[^ ]*/\$upstream_peak/g
w $OUTPUT
q
EOF
  fi
else
  # the current hour is outside peak times
  ed -s /etc/pf.conf << EOF
/^queue fq on [$]uplink/s/[$]upstream_[^ ]*/\$upstream_offpeak/g
w $OUTPUT
q
EOF
fi
