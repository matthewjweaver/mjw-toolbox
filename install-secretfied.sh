#!/bin/sh
# Usage:
#  install-secretfied.sh <input> <install(1) flags> <target>
#
# This script will create a tmp file as its output, and use install(1)
# to copy that file to the specified target.
#
# This script is expected to be run via the 1Password CLI's "run"
# command, ie 'op run -- sh install-0secretfied.sh'.
#
# For each string in the form XXX_SOMETHING_XXX in the input file, the
# script assumes the presence of a matching env variable containing a
# secret fetched by op. See .env files near the Makefiles for a mapping
# of variable names to vault locations.
#
# Finally, the script removes the temporary file.
#
# This script will break badly if a secret contains an '@', since that
# is what the script uses as a field delimiter for the sed command.

#set -x
set -e

OP="/home/sysop/bin/op"
VAULT="Personal"
FIELD="password"

if ! [[ -f "$1" ]]; then
  echo "Usage: "
  echo '  install-secretfied.sh <input> <install(1) flags> <target>'
  exit 1
fi

TMPFILE=`mktemp` || exit 1
cp $1 $TMPFILE

for TOKEN in $(grep XXX $TMPFILE |sed -e's/^[^X]*XXX_/XXX_/g' -e's/_XXX[^_]*$/_XXX/g'); do
  eval "SECRET=\$$TOKEN"
  sed -i -e "s@$TOKEN@$SECRET@" $TMPFILE
done
/usr/bin/doas /usr/bin/install $2 $TMPFILE $3
/bin/rm $TMPFILE
