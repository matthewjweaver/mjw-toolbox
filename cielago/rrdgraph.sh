#!/bin/sh

# Size graphs to look nice on my laptop
W=850
H=200

# default y axis to 100M (will grow if necessary)
MAX_BW_DL=100000000
MAX_BW_UL=100000000

# steal solarized colors
base03="#002b36"
base02="#073642"
base01="#586e75"
base00="#657b83"
base0="#839496"
base1="#93a1a1"
base2="#eee8d5"
base3="#fdf6e3"
yellow="#b58900"
orange="#cb4b16"
red="#dc322f"
magenta="#d33682"
violet="#6c71c4"
blue="#268bd2"
cyan="#2aa198"
green="#859900"

bps_graph() {
  RRD_CMD="${1}"
  RRD_CMD="${RRD_CMD} --upper-limit ${MAX_BW_UL}"
  RRD_CMD="${RRD_CMD} --lower-limit -${MAX_BW_DL}"

  # bytes, in
  RRD_CMD="${RRD_CMD} DEF:ssh-B-in=/var/db/rrd/em0-22-in.rrd:bytes_in:AVERAGE"
  RRD_CMD="${RRD_CMD} DEF:dns_tls-B-in=/var/db/rrd/em0-853-in.rrd:bytes_in:AVERAGE"
  RRD_CMD="${RRD_CMD} DEF:dns-B-in=/var/db/rrd/em0-53-in.rrd:bytes_in:AVERAGE"
  RRD_CMD="${RRD_CMD} DEF:http-B-in=/var/db/rrd/em0-80-in.rrd:bytes_in:AVERAGE"
  RRD_CMD="${RRD_CMD} DEF:https-B-in=/var/db/rrd/em0-443-in.rrd:bytes_in:AVERAGE"
  RRD_CMD="${RRD_CMD} DEF:other-B-in=/var/db/rrd/em0-other-in.rrd:bytes_in:AVERAGE"

  # bytes, out
  RRD_CMD="${RRD_CMD} DEF:ssh-B-out=/var/db/rrd/em0-22-out.rrd:bytes_out:AVERAGE"
  RRD_CMD="${RRD_CMD} DEF:dns_tls-B-out=/var/db/rrd/em0-853-out.rrd:bytes_out:AVERAGE"
  RRD_CMD="${RRD_CMD} DEF:dns-B-out=/var/db/rrd/em0-53-out.rrd:bytes_out:AVERAGE"
  RRD_CMD="${RRD_CMD} DEF:http-B-out=/var/db/rrd/em0-80-out.rrd:bytes_out:AVERAGE"
  RRD_CMD="${RRD_CMD} DEF:https-B-out=/var/db/rrd/em0-443-out.rrd:bytes_out:AVERAGE"
  RRD_CMD="${RRD_CMD} DEF:other-B-out=/var/db/rrd/em0-other-out.rrd:bytes_out:AVERAGE"

  # bps in, made negative so it will graph "down"
  RRD_CMD="${RRD_CMD} CDEF:ssh-b-in=0,ssh-B-in,-,8,*"
  RRD_CMD="${RRD_CMD} CDEF:dns_tls-b-in=0,dns_tls-B-in,-,8,*"
  RRD_CMD="${RRD_CMD} CDEF:dns-b-in=0,dns-B-in,-,8,*"
  RRD_CMD="${RRD_CMD} CDEF:http-b-in=0,http-B-in,-,8,*"
  RRD_CMD="${RRD_CMD} CDEF:https-b-in=0,https-B-in,-,8,*"
  RRD_CMD="${RRD_CMD} CDEF:other-b-in=0,other-B-in,-,8,*"
  
  # bps out
  RRD_CMD="${RRD_CMD} CDEF:ssh-b-out=ssh-B-out,8,*"
  RRD_CMD="${RRD_CMD} CDEF:dns_tls-b-out=dns_tls-B-out,8,*"
  RRD_CMD="${RRD_CMD} CDEF:dns-b-out=dns-B-out,8,*"
  RRD_CMD="${RRD_CMD} CDEF:http-b-out=http-B-out,8,*"
  RRD_CMD="${RRD_CMD} CDEF:https-b-out=https-B-out,8,*"
  RRD_CMD="${RRD_CMD} CDEF:other-b-out=other-B-out,8,*"
  
  # graph bandwidth in
  RRD_CMD="${RRD_CMD} AREA:ssh-b-in${orange}:ssh_bps:STACK"
  RRD_CMD="${RRD_CMD} AREA:dns_tls-b-in${green}:dns_tls_bps:STACK"
  RRD_CMD="${RRD_CMD} AREA:dns-b-in${blue}:dns_bps:STACK"
  RRD_CMD="${RRD_CMD} AREA:http-b-in${red}:http_bps:STACK"
  RRD_CMD="${RRD_CMD} AREA:https-b-in${magenta}:https_bps:STACK"
  RRD_CMD="${RRD_CMD} AREA:other-b-in${cyan}:other_bps:STACK"
  
  # graph bandwidth out (no legend for these, same colors as above)
  RRD_CMD="${RRD_CMD} AREA:ssh-b-out${orange}::STACK"
  RRD_CMD="${RRD_CMD} AREA:dns_tls-b-out${green}::STACK"
  RRD_CMD="${RRD_CMD} AREA:dns-b-out${blue}::STACK"
  RRD_CMD="${RRD_CMD} AREA:http-b-out${red}::STACK"
  RRD_CMD="${RRD_CMD} AREA:https-b-out${magenta}::STACK"
  RRD_CMD="${RRD_CMD} AREA:other-b-out${cyan}::STACK"

  doas nice $RRD_CMD > /dev/null
}
  
pps_graph() {
  RRD_CMD="${1}"

  # packets, in
  RRD_CMD="${RRD_CMD} DEF:ssh-p-in=/var/db/rrd/em0-22-in.rrd:packets_in:AVERAGE"
  RRD_CMD="${RRD_CMD} DEF:dns_tls-p-in=/var/db/rrd/em0-853-in.rrd:packets_in:AVERAGE"
  RRD_CMD="${RRD_CMD} DEF:dns-p-in=/var/db/rrd/em0-53-in.rrd:packets_in:AVERAGE"
  RRD_CMD="${RRD_CMD} DEF:http-p-in=/var/db/rrd/em0-80-in.rrd:packets_in:AVERAGE"
  RRD_CMD="${RRD_CMD} DEF:https-p-in=/var/db/rrd/em0-443-in.rrd:packets_in:AVERAGE"
  RRD_CMD="${RRD_CMD} DEF:other-p-in=/var/db/rrd/em0-other-in.rrd:packets_in:AVERAGE"

  # packets, out
  RRD_CMD="${RRD_CMD} DEF:ssh-pps-out=/var/db/rrd/em0-22-out.rrd:packets_out:AVERAGE"
  RRD_CMD="${RRD_CMD} DEF:dns_tls-pps-out=/var/db/rrd/em0-853-out.rrd:packets_out:AVERAGE"
  RRD_CMD="${RRD_CMD} DEF:dns-pps-out=/var/db/rrd/em0-53-out.rrd:packets_out:AVERAGE"
  RRD_CMD="${RRD_CMD} DEF:http-pps-out=/var/db/rrd/em0-80-out.rrd:packets_out:AVERAGE"
  RRD_CMD="${RRD_CMD} DEF:https-pps-out=/var/db/rrd/em0-443-out.rrd:packets_out:AVERAGE"
  RRD_CMD="${RRD_CMD} DEF:other-pps-out=/var/db/rrd/em0-other-out.rrd:packets_out:AVERAGE"

  # packets in, made negative so it will graph "down"
  RRD_CMD="${RRD_CMD} CDEF:ssh-pps-in=0,ssh-p-in,-"
  RRD_CMD="${RRD_CMD} CDEF:dns_tls-pps-in=0,dns_tls-p-in,-"
  RRD_CMD="${RRD_CMD} CDEF:dns-pps-in=0,dns-p-in,-"
  RRD_CMD="${RRD_CMD} CDEF:http-pps-in=0,http-p-in,-"
  RRD_CMD="${RRD_CMD} CDEF:https-pps-in=0,https-p-in,-"
  RRD_CMD="${RRD_CMD} CDEF:other-pps-in=0,other-p-in,-"

  # graph packets in
  RRD_CMD="${RRD_CMD} LINE:ssh-pps-in${orange}:ssh_pps"
  RRD_CMD="${RRD_CMD} LINE:dns_tls-pps-in${green}:dns_tls_pps"
  RRD_CMD="${RRD_CMD} LINE:dns-pps-in${blue}:dns_pps"
  RRD_CMD="${RRD_CMD} LINE:http-pps-in${red}:http_pps"
  RRD_CMD="${RRD_CMD} LINE:https-pps-in${magenta}:https_pps"
  RRD_CMD="${RRD_CMD} LINE:other-pps-in${cyan}:other_pps"

  # graph packets out
  RRD_CMD="${RRD_CMD} LINE:ssh-pps-out${orange}"
  RRD_CMD="${RRD_CMD} LINE:dns_tls-pps-out${green}"
  RRD_CMD="${RRD_CMD} LINE:dns-pps-out${blue}"
  RRD_CMD="${RRD_CMD} LINE:http-pps-out${red}"
  RRD_CMD="${RRD_CMD} LINE:https-pps-out${magenta}"
  RRD_CMD="${RRD_CMD} LINE:other-pps-out${cyan}"

  doas nice $RRD_CMD > /dev/null
}

if [ "${1}" = "--day" ]; then
  times="24h"
elif [ "${1}" = "--week" ]; then
  times="7d"
elif [ "${1}" = "--month" ]; then
  times="28d"
elif [ "${1}" = "--year" ]; then
  times="1y"
elif [ "${1}" = "--time" ]; then
  times="${2}"
else
  times="1h"
fi

for t in ${times}; do
  for r in bps pps; do
    f="/var/www/htdocs/pf/${r}-${t}.svg"
  
    RRD_PFX=""
    RRD_PFX="${RRD_PFX} rrdtool graph ${f}"
    RRD_PFX="${RRD_PFX} -a SVG -d unix:/var/run/rrd/rrdcached.sock"
    RRD_PFX="${RRD_PFX} -e now -s end-${t}"
    RRD_PFX="${RRD_PFX} -w ${W} -h ${H} --full-size-mode"
    RRD_PFX="${RRD_PFX} --color BACK${base03}"
    RRD_PFX="${RRD_PFX} --color CANVAS${base02}"
    RRD_PFX="${RRD_PFX} --color GRID${base01}"
    RRD_PFX="${RRD_PFX} --color FONT${base0}"
    RRD_PFX="${RRD_PFX} --color AXIS${base1}"
    RRD_PFX="${RRD_PFX} --border 0"
    RRD_PFX="${RRD_PFX} --lazy"

    ${r}_graph "${RRD_PFX}"
  done
done
