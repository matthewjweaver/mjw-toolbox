#!/bin/ksh
#
# Using blacklist from pi-hole project https://github.com/pi-hole/
# to enable AD blocking in unbound(8)
#
PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"

# Available blocklists - comment line to disable blocklist
_malwaredom="https://mirror1.malwaredomains.com/files/justdomains"
_stevenblack="https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling/hosts"

# Global variables
_tmpfile="$(mktemp)" && echo '' > $_tmpfile
_unboundconf="/var/unbound/etc/unbound-blacklist.conf"

# Remove comments from blocklist
function simpleParse {
  ftp -VMo - $1 | \
  sed -e 's/#.*$//' -e '/^[[:space:]]*$/d' >> $2
}

# Parse MalwareDom
[[ -n ${_malwaredom+x} ]] && simpleParse $_malwaredom $_tmpfile

# Parse StevenBlack
[[ -n ${_stevenblack+x} ]] && \
  ftp -VMo - $_stevenblack | \
  sed -n '/Start/,$p' | \
  sed -e 's/#.*$//' -e '/^[[:space:]]*$/d' | \
  awk '/^0.0.0.0/ { print $2 }' >> $_tmpfile

# Create unbound(8) local zone file
sort -fu $_tmpfile | grep -v "^[[:space:]]*$" | \
awk '{
  print "local-zone: \"" $1 "\" redirect"
  print "local-data: \"" $1 " A 0.0.0.0\""
}' > $_unboundconf && rm -f $_tmpfile

# Reload unbound(8) blocklist
doas -u _unbound unbound-checkconf >/dev/null 2>&1 && \
doas -u _unbound unbound-control reload 1>/dev/null

exit 0
#EOF
