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
  RRD_CMD="${RRD_CMD} DEF:tabr-B-in=/var/db/rrd/em0-in.rrd:bytes_in:AVERAGE"

  # bytes, out
  RRD_CMD="${RRD_CMD} DEF:tabr-B-out=/var/db/rrd/em0-out.rrd:bytes_out:AVERAGE"

  # bps in, made negative so it will graph "down"
  RRD_CMD="${RRD_CMD} CDEF:tabr-b-in=0,tabr-B-in,-,8,*"
  
  # bps out
  RRD_CMD="${RRD_CMD} CDEF:tabr-b-out=tabr-B-out,8,*"
  
  # graph bandwidth in
  RRD_CMD="${RRD_CMD} AREA:tabr-b-in${cyan}:sietchtabr_bps:STACK"
  
  # graph bandwidth out (no legend for these, same colors as above)
  RRD_CMD="${RRD_CMD} AREA:tabr-b-out${cyan}::STACK"

  doas nice $RRD_CMD > /dev/null
}
  
pps_graph() {
  RRD_CMD="${1}"

  # packets, in
  RRD_CMD="${RRD_CMD} DEF:tabr-p-in=/var/db/rrd/em0-in.rrd:packets_in:MAX"

  # packets, out
  RRD_CMD="${RRD_CMD} DEF:tabr-pps-out=/var/db/rrd/em0-out.rrd:packets_out:MAX"

  # packets in, made negative so it will graph "down"
  RRD_CMD="${RRD_CMD} CDEF:tabr-pps-in=0,tabr-p-in,-"

  # graph packets in
  RRD_CMD="${RRD_CMD} LINE:tabr-pps-in${cyan}:sietchtabr_pps"

  # graph packets out
  RRD_CMD="${RRD_CMD} LINE:tabr-pps-out${cyan}"

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
