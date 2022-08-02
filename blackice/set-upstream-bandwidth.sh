#!/bin/sh
set -e

# Usage: '-t' means to test, outputting to /tmp/pf.conf instead of
# /etc/pf.conf.

# These hours are firewall's local timezone
# Beginning at PEAK_START_HOUR, and ending at PEAK_END_HOUR, the
# firewall's uplink interface will be set to $upstream_peak bandwidth.
# Otherwise, it will be set to $upstream_offpeak bandwidth.
PEAK_START_HOUR="16"
PEAK_END_HOUR="23"

# Cut out only the hour portion of the time
HOUR_NOW=$(date "+%H")

if [ "$1" = "-t" ]; then
  OUTPUT="/tmp/pf.conf"
  RELOAD="no"
else
  OUTPUT="/etc/pf.conf"
  RELOAD="yes"
fi

# The ed operations below find lines which start with:
#   "queue fq on $uplink"
# They then replace any word on that line beginning with:
#   "$upstream_"
# with either $upstream_peak or $upstream_offpeak, depending on the hour
# of the day.
if [ $HOUR_NOW -ge $PEAK_START_HOUR ] && [ $HOUR_NOW -lt $PEAK_END_HOUR ]; then
  # The current hour is inside peak times
  ed -s /etc/pf.conf << EOF
/^queue fq on [$]uplink/s/[$]upstream_[^ ]*/\$upstream_peak/g
w $OUTPUT
q
EOF
else
  # the current hour is outside peak times
  ed -s /etc/pf.conf << EOF
/^queue fq on [$]uplink/s/[$]upstream_[^ ]*/\$upstream_offpeak/g
w $OUTPUT
q
EOF
fi

if [ $RELOAD = "yes" ]; then
  /sbin/pfctl -nf /etc/pf.conf && /sbin/pfctl -f /etc/pf.conf
fi
