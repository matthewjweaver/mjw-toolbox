#!/bin/sh
f=/home/sysop/log/uplink-status-$(date "+%Y%m")
if ping -nqc 3 -w 5 8.8.8.8 > /dev/null 2>&1; then
  date "+%Y%m%d-%H:%M:%S-%Z;UP" >> ${f}
else
  date "+%Y%m%d-%H:%M:%S-%Z;DOWN" >> ${f}
  traceroute -lnw 2 8.8.8.8 > \
    /home/sysop/log/traceroutes/uplink-$(date "+%Y%m%d-%H:%M:%S-%Z") 2>&1
fi
