#!/bin/sh
set -e
umask 027

# TODO(mjw)
#   1. make work via an openbsd ramdisk kernel

# This entire thing depends on the 1password CLI, op.

# Since the OpenBSD ramdisk doesn't have either ssh or libressl on it, I
# couldn't figure out a praxis for restoring using only the ramdisk.
# Therefore, this script has a few prerequisites:
#   1. The target system disk exists as /dev/sd1
#   2. The target system disk has sufficient size to support the backed
#   up disklabel.
#
# In general, the assumption is that this script is run on a host like
# axlotl.tank.int.nodeless.net, with the target disk as sd1.


usage() {
  echo "Usage:"
  echo "  backup.sh <hostname> <backup number> <disk UUID>"
  echo
  echo "Example:"
  echo "  backup.sh korba.nodeless.net c99a329534106e59 num-1"
  echo
  echo "Requires authenticated 1password."
  echo 'For instance, eval $(op signin) before executing.'
}

if ! op whoami 2>&1 > /dev/null; then
  echo "ERROR: Unable to confirm that op (1password) is available."
  usage
  exit
fi

TARGET_HOST=${1}
if [ -z ${TARGET_HOST} ]; then
  usage
  exit
fi

# We assume the machine is a more or less new install, with only a root
# user.
TARGET_USER=root

PASSWORD=$(op read op://Personal/${TARGET_HOST}/dump-chacha-key)
if [ -z ${PASSWORD} ]; then
  echo "ERROR: Cannot find encryption password for target host using op."
  echo
  usage
  exit
fi

BACKUPS_ROOT=/arc/obsd-bak/dumps/${TARGET_HOST}
if ! [ -d ${BACKUPS_ROOT} ]; then
  echo "ERROR: ${BACKUPS_ROOT} doesn't exist, exiting."
  echo
  usage()
  exit
fi

BACKUP_DIR=${BACKUPS_ROOT}/lvl-0-${2}
if ! [ -d ${BACKUP_DIR} ]; then
  echo "ERROR: ${BACKUP_DIR} doesn't exist, exiting."
  echo "available backups:"
  ls ${BACKUPS_ROOT}
  echo
  usage()
  exit
fi

for DUMP in $(ls ${BACKUP_DIR}/*chacha); do
  PARTITION=$(basename ${DUMP} .gz.chacha)
  TARGET_DIR=$(< ${BACKUP_DIR}/fstab awk "/${PARTITION}/ {print "'$2}')
  # We ssh with StrictHostKeyChecking=no because we haven't restored the
  # ssh host keys from backup yet.
  #< $DUMP /usr/bin/openssl enc -d -chacha -iter 1000000 -k "${PASSWORD}" |\
  #gunzip - |\
  #ssh -o StrictHostKeyChecking=no root@${TARGET_HOST} "set -e; cd ${TARGET_DIR}; restore ryf -" 
done

