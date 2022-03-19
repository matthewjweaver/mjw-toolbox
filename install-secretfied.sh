#!/bin/sh
# Usage:
#  install-secretfied.sh <input> <install(1) flags> <target>
#
# This script will create a tmp file as its output, and use install(1)
# to copy that file to the specified target.
#
# For each string in the form XXX_SOMETHING_XXX in the input file, the
# script will prompt the user for a replacement, and replace the string
# with the provided input in the temp file.
#
# User input is not echoed, so this can be used to place scerets into
# files prior to their installation in a system.
#
# Finally, the script removes the temporary file.

set -e

if ! [[ -f "$1" ]]; then
  echo "Usage: "
  echo '  install-secretfied.sh <input> <install(1) flags> <target>'
  exit 1
fi

TMPFILE=`mktemp` || exit 1
cp $1 $TMPFILE

for TOKEN in $(grep XXX $TMPFILE |sed -e's/^[^X]*//g' -e's/XXX[^_]*$/XXX/g'); do
  # Don't echo input, read preserving whitespace and ignoring backslash
  # escapes.
  stty -echo
  IFS= read -r SECRET?"$TOKEN ? "
  stty echo
  echo
  sed -i -e "s@$TOKEN@\"$SECRET\"@" $TMPFILE
done
/usr/bin/install $2 $TMPFILE $3
/bin/rm $TMPFILE
