#!/bin/sh
set -e
umask 027

# TODO(mjw)
#   1. make work for a single host & most recent dump

# This entire thing depends on the 1password CLI, op.

usage() {
  echo "Usage:"
  echo "  backup.sh <hostname>"
  echo
  echo "Example:"
  echo "  backup.sh korba.nodeless.net"
  echo
  echo "Requires authenticated 1password."
  echo "For instance, eval $(op signin) before executing."
}

if ! op whoami 2>&1 > /dev/null; then
  echo "Unable to confirm that op (1password) is available."
  usage
  exit
fi

TARGET_HOST=${1}
if [ -z ${TARGET_HOST} ]; then
  usage
  exit
fi

TARGET_USER=$(op read op://Personal/${TARGET_HOST}/admin)
if ! [ -z ${TARGET_USER} ]; then
  echo "Will login as ${TARGET_USER} to ${TARGET_HOST}."
else
  echo "Unable to find target user on host using op."
  echo
  usage
  exit
fi

PASSWORD=$(op read op://Personal/${TARGET_HOST}/dump-chacha-key)
if [ -z ${PASSWORD} ]; then
  echo "Cannot find encryption password for target host using op."
  echo
  usage
  exit
fi

BACKUPS_ROOT=/arc/obsd-bak/dumps/${TARGET_HOST}
if ! [ -d ${BACKUPS_ROOT} ]; then
  echo "${BACKUPS_ROOT} doesn't exist, exiting."
  exit
fi

# probably:
# disklabel the drive
# for each dump, restore whole thing to partition
# maybe: in parallel?
