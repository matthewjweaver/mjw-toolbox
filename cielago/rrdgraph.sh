#!/bin/sh
set -x

# Size graphs to look nice on my laptop
W=1150
H=200

# link speed (160M)
MAX_BW_DL=160000000
MAX_BW_UL=25000000

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

f="/var/www/htdocs/pf/bps-out-highres.png"

RRD_CMD=""
RRD_CMD="${RRD_CMD} rrdtool graph ${f}"
RRD_CMD="${RRD_CMD} -a PNG -d unix:/var/run/rrd/rrdcached.sock"
RRD_CMD="${RRD_CMD} -e now -s end-4h"
RRD_CMD="${RRD_CMD} -w ${W} -h ${H} --full-size-mode"
RRD_CMD="${RRD_CMD} --upper-limit ${MAX_BW_UL}"
RRD_CMD="${RRD_CMD} --lower-limit -${MAX_BW_DL} --rigid"
RRD_CMD="${RRD_CMD} --color BACK${base03}"
RRD_CMD="${RRD_CMD} --color CANVAS${base02}"
RRD_CMD="${RRD_CMD} --color GRID${base01}"
RRD_CMD="${RRD_CMD} --color FONT${base0}"
RRD_CMD="${RRD_CMD} --color AXIS${base1}"
RRD_CMD="${RRD_CMD} --border 0"

# bytes, in
RRD_CMD="${RRD_CMD} DEF:hq-B-in=/var/db/rrd/96.73.134.170-in.rrd:bytes_in:AVERAGE"
RRD_CMD="${RRD_CMD} DEF:korba-B-in=/var/db/rrd/96.73.134.171-in.rrd:bytes_in:AVERAGE"
RRD_CMD="${RRD_CMD} DEF:umbu-B-in=/var/db/rrd/96.73.134.172-in.rrd:bytes_in:AVERAGE"
RRD_CMD="${RRD_CMD} DEF:tabr-B-in=/var/db/rrd/96.73.134.173-in.rrd:bytes_in:AVERAGE"

# bytes, out
RRD_CMD="${RRD_CMD} DEF:hq-B-out=/var/db/rrd/96.73.134.170-out.rrd:bytes_out:AVERAGE"
RRD_CMD="${RRD_CMD} DEF:korba-B-out=/var/db/rrd/96.73.134.171-out.rrd:bytes_out:AVERAGE"
RRD_CMD="${RRD_CMD} DEF:umbu-B-out=/var/db/rrd/96.73.134.172-out.rrd:bytes_out:AVERAGE"
RRD_CMD="${RRD_CMD} DEF:tabr-B-out=/var/db/rrd/96.73.134.173-out.rrd:bytes_out:AVERAGE"

# bps in, made negative so it will graph "down"
RRD_CMD="${RRD_CMD} CDEF:hq-b-in=0,hq-B-in,-,8,*"
RRD_CMD="${RRD_CMD} CDEF:korba-b-in=0,korba-B-in,-,8,*"
RRD_CMD="${RRD_CMD} CDEF:umbu-b-in=0,umbu-B-in,-,8,*"
RRD_CMD="${RRD_CMD} CDEF:tabr-b-in=0,tabr-B-in,-,8,*"

# bps out
RRD_CMD="${RRD_CMD} CDEF:hq-b-out=hq-B-out,8,*"
RRD_CMD="${RRD_CMD} CDEF:korba-b-out=korba-B-out,8,*"
RRD_CMD="${RRD_CMD} CDEF:umbu-b-out=umbu-B-out,8,*"
RRD_CMD="${RRD_CMD} CDEF:tabr-b-out=tabr-B-out,8,*"

# graph bandwidth in
RRD_CMD="${RRD_CMD} AREA:hq-b-in${violet}:layeraleph_bps:STACK"
RRD_CMD="${RRD_CMD} AREA:korba-b-in${blue}:korba_bps:STACK"
RRD_CMD="${RRD_CMD} AREA:umbu-b-in${cyan}:sietchumbu_bps:STACK"
RRD_CMD="${RRD_CMD} AREA:tabr-b-in${green}:sietchtabr_bps:STACK"

# graph bandwidth out (no legend for these, same colors as above)
RRD_CMD="${RRD_CMD} AREA:hq-b-out${violet}::STACK"
RRD_CMD="${RRD_CMD} AREA:korba-b-out${blue}::STACK"
RRD_CMD="${RRD_CMD} AREA:umbu-b-out${cyan}::STACK"
RRD_CMD="${RRD_CMD} AREA:tabr-b-out${green}::STACK"

# packets, in
#RRD_CMD="${RRD_CMD} DEF:hq-p-in=/var/db/rrd/96.73.134.170-in.rrd:packets_in:AVERAGE"
#RRD_CMD="${RRD_CMD} DEF:korba-p-in=/var/db/rrd/96.73.134.171-in.rrd:packets_in:AVERAGE"
#RRD_CMD="${RRD_CMD} DEF:umbu-p-in=/var/db/rrd/96.73.134.172-in.rrd:packets_in:AVERAGE"
#RRD_CMD="${RRD_CMD} DEF:tabr-p-in=/var/db/rrd/96.73.134.173-in.rrd:packets_in:AVERAGE"

# packets, out
#RRD_CMD="${RRD_CMD} DEF:hq-pps-out=/var/db/rrd/96.73.134.170-out.rrd:packets_out:AVERAGE"
#RRD_CMD="${RRD_CMD} DEF:korba-pps-out=/var/db/rrd/96.73.134.171-out.rrd:packets_out:AVERAGE"
#RRD_CMD="${RRD_CMD} DEF:umbu-pps-out=/var/db/rrd/96.73.134.172-out.rrd:packets_out:AVERAGE"
#RRD_CMD="${RRD_CMD} DEF:tabr-pps-out=/var/db/rrd/96.73.134.173-out.rrd:packets_out:AVERAGE"

# packets in, made negative so it will graph "down"
#RRD_CMD="${RRD_CMD} CDEF:hq-pps-in=0,hq-p-in,-"
#RRD_CMD="${RRD_CMD} CDEF:korba-pps-in=0,korba-p-in,-"
#RRD_CMD="${RRD_CMD} CDEF:umbu-pps-in=0,umbu-p-in,-"
#RRD_CMD="${RRD_CMD} CDEF:tabr-pps-in=0,tabr-p-in,-"

# graph packets in
#RRD_CMD="${RRD_CMD} LINE:hq-pps-in${yellow}:layeraleph_pps"
#RRD_CMD="${RRD_CMD} LINE:korba-pps-in${orange}:korba_pps"
#RRD_CMD="${RRD_CMD} LINE:umbu-pps-in${red}:sietchumbu_pps"
#RRD_CMD="${RRD_CMD} LINE:tabr-pps-in${magenta}:sietchtabr_pps"

# graph packets out
#RRD_CMD="${RRD_CMD} LINE:hq-pps-out${yellow}"
#RRD_CMD="${RRD_CMD} LINE:korba-pps-out${orange}"
#RRD_CMD="${RRD_CMD} LINE:umbu-pps-out${red}"
#RRD_CMD="${RRD_CMD} LINE:tabr-pps-out${magenta}"

$RRD_CMD
