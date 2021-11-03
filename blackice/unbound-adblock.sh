#!/bin/sh
# Copyright 2020 Jordan Geoghegan <jordan@geoghegan.ca>

# Permission to use, copy, modify, and/or distribute this software for any 
# purpose with or without fee is hereby granted, provided that the above 
# copyright notice and this permission notice appear in all copies.

# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH 
# REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM 
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE 
# OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR 
# PERFORMANCE OF THIS SOFTWARE.

# Version 0.4 "It Hurts Everytime" -- Released July 1st 2020

# In loving memory of Ron Sather

# Download and parse StevenBlack hosts file into unbound compatible format

# -------------------------------------------------------------------

### User Configuration Area -- BEGIN

# Add blocklists below, one URL per line
# Blocklists MUST be in /etc/hosts format
blocklists=$(cat <<'EOF'
https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
EOF
)

# Add whitelist entries below:
# Note: Make all domains lowercase!
whitelist() {
	grep -E -v 'example\.com|example\.org'
}

### User Configuration Area -- END

# -------------------------------------------------------------------

cleanup () {
	rm -f "$tmpfile"
}

trapper() {
	cleanup && exit
}

abort () {
	printf '\nBad Data in %s! Reverting changes and bailing out!\n\n' "$listpath" ; cp /dev/null "$listpath" ; cleanup ; exit 1
}

network_check_abort() {
	printf '\nNo Network Connectivity! Quitting without making changes...\n\n' ; cleanup ; exit 1
}

dl_abort () {
	printf '\nFailed to Download One or More Blocklists! Quitting Without Making Changes...\n\n' ; cleanup ; exit 1
}

list_update_abort () {
	printf '\nFailed to update /var/unbound/etc/adblock.conf! Please ensure the file has correct permissions and that the partition has free space!\n\n' ; cleanup ; exit 1
}

help_message() {
	printf '\nunbound-adblock Version 0.4\nJordan Geoghegan <jordan@geoghegan.ca>\n\n'
	printf 'unbound-adblock provides blocklists from quality trusted sources to feed into Unbound\n\n'
	printf 'Supported Operating Systems:\n  OpenBSD\n  FreeBSD\n  NetBSD\n  DragonflyBSD\n  Linux\n'
	printf 'Alternate OS can be supplied as an argument: "-freebsd" or "-dragonflybsd" etc\n'
	printf 'OS arguments are case insensitive\n'
}


# -------------------------------------------------------------------

# Variables, Macros and Traps

# Set trap handler
trap trapper EXIT
trap trapper INT

# Print help message
if [ "$1" = "-h" ]; then
  help_message && exit
fi

# Make sure we're running as "_adblock" user
if [ "$(whoami)" != "_adblock" ]; then
	printf "\n\nScript must be run as user \"_adblock\"\nExiting...\n\n"; exit 1
fi

# If Operating System not specified as commandline argument, assume we're running on OpenBSD
if [ -z "$1" ];
then
  ostype="-openbsd"
else
  ostype="$(echo "$1" | tr '[:upper:]' '[:lower:]')"
fi

# Make sure we make appropriate use of doas/sudo and ftp/curl
case "$ostype" in
-openbsd)
  getroot="doas"
  netget="ftp"
  netgetarg="-o"
  rcd="rcctl"
  rcdarg1="reload"
  rcdarg2="unbound"
  listpath="/var/unbound/etc/adblock.conf"
  ;;
-freebsd)
  getroot="doas"
  netget="fetch"
  netgetarg="-qo"
  rcd="service"
  rcdarg1="unbound"
  rcdarg2="restart"
  listpath="/etc/unbound/adblock.conf"
  ;;
-netbsd)
  getroot="/usr/pkg/bin/doas"
  netget="ftp"
  netgetarg="-o"
  rcd="service"
  rcdarg1="unbound"
  rcdarg2="restart"
  listpath="/etc/unbound/adblock.conf"
  ;;
-dragonflybsd)
  getroot="doas"
  netget="ftp"
  netgetarg="-o"
  rcd="service"
  rcdarg1="unbound"
  rcdarg2="restart"
  listpath="/usr/local/etc/unbound/adblock.conf"
  ;;
-linux)
  getroot="sudo"
  netget="wget"
  netgetarg="-qO"
  rcd="systemctl"
  rcdarg1="restart"
  rcdarg2="unbound"
  listpath="/etc/unbound/adblock.conf"
  ;;
-alpine)
  getroot="doas"
  netget="wget"
  netgetarg="-qO"
  rcd="rc-service"
  rcdarg1="unbound"
  rcdarg2="restart"
  listpath="/etc/unbound/adblock.conf"
  ;;
*)
  printf "\n\nUnknown Operating System Specified. Available Options Are:\n  OpenBSD\n  FreeBSD\n  NetBSD\n  DragonflyBSD\n  Linux\n"
  printf "\nQuitting Without Making Changes...\n"
  exit 1
  ;;
esac

tmpfile=$(mktemp)

# Check for network connectivity to GitHub, bail out if fail
"$netget" "$netgetarg" - https://github.com > /dev/null || network_check_abort

# Do not edit this unless you know what you're doing
echo "$blocklists" |  xargs -n 1 "$netget" "$netgetarg" -  > "$tmpfile" || dl_abort
tr -cd '[:alnum:][:blank:]%#.~\n_-' < "$tmpfile" | nice awk '{sub(/^127\.0\.0\.1/,"0.0.0.0")} BEGIN { OFS = "" } NF == 2 && $1 == "0.0.0.0" { print "local-zone: \"", $2, "\" always_nxdomain"}' | tr '[:upper:]' '[:lower:]' | whitelist | sort -u > "$listpath" || list_update_abort
unbound-checkconf || abort
"$getroot" "$rcd" "$rcdarg1" "$rcdarg2"|| abort

# Clean up after ourselves
cleanup
