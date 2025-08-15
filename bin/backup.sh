#!/bin/sh
set -e
umask 027

# XXX 20250808 TODO(mjw):
#   1. automate somehow

# This entire thing depends on the 1password CLI, op.

usage() {
  echo "Usage:"
  echo "  backup.sh <hostname>"
  echo
  echo "Example:"
  echo "  backup.sh korba.nodeless.net"
  echo
  echo "Requires authenticated 1password."
  echo 'For instance, eval $(op signin) before executing.'
}

if ! op whoami 2>&1 > /dev/null; then
  echo "Unable to confirm that op (1password) is available."
  echo
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

# Keep backups within a 12 week window, so we mod the number of the
# week by twelve to number the output files.
BACKUP_NUMBER=$(echo "$(date '+%U') % 12"|bc)
BACKUP_SUFFIX=lvl-0-num-${BACKUP_NUMBER}

BACKUP_DIR=${BACKUPS_ROOT}/${BACKUP_SUFFIX}
if ! [ -d ${BACKUP_DIR} ]; then
  doas mkdir -p ${BACKUP_DIR}
fi
doas chown root.wheel ${BACKUP_DIR}
doas chmod 770 ${BACKUP_DIR}

# Use 'doas dd' since we can't simply redirect (this shell not
# owned by superuser).
TARGET_FSTAB=${BACKUP_DIR}/fstab
ssh ${TARGET_USER}@${TARGET_HOST} "doas cat /etc/fstab" | \
  doas dd status=none of=${TARGET_FSTAB}
doas chmod 640 ${TARGET_FSTAB}

# Include in the backup disklabels of all disks in the target machine.
UUIDS=$(doas awk '/ffs/ {print $1}' ${TARGET_FSTAB}|sed -e's/[.].*$//g'|sort|uniq)
for DISK in ${UUIDS}; do
  TARGET_DISKLABEL=${BACKUP_DIR}/disklabel-${DISK}
  ssh ${TARGET_USER}@${TARGET_HOST} "doas disklabel ${DISK}" | \
    doas dd status=none of=${TARGET_DISKLABEL}
  doas chmod 640 ${TARGET_DISKLABEL}
done

for PARTITION in $( < ${BACKUP_DIR}/fstab awk '/ffs/ { print $1 }' ); do
  BACKUP_OUTPUT=${BACKUP_DIR}/${PARTITION}.dump.gz.chacha
  if ! [ -f ${BACKUP_OUTPUT} ]; then
    doas touch ${BACKUP_OUTPUT}
  fi
  doas chmod 640 ${BACKUP_OUTPUT}

  LOG_OUTPUT=${BACKUP_DIR}/${PARTITION}.log
  doas cp /dev/null ${LOG_OUTPUT}
  doas chown root.wheel ${LOG_OUTPUT}
  doas chmod 660 ${LOG_OUTPUT}

  ssh ${TARGET_USER}@${TARGET_HOST} "doas dump -0af - ${PARTITION}| \
    gzip -1 -| \
    /usr/bin/openssl enc -chacha -iter 1000000 -k \"${PASSWORD}\"" 2>> ${LOG_OUTPUT} | \
    doas dd of=${BACKUP_OUTPUT} bs=4M 2>> ${LOG_OUTPUT}
done

doas touch ${BACKUP_DIR}
