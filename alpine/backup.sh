#!/bin/sh
set -e
umask 027

# This entire thing depends on the linux 1password CLI, op.

usage() {
  echo "Usage:"
  echo "  backup.sh"
  echo
  echo "Example:"
  echo "  backup.sh"
  echo
  echo "Requires authenticated 1password."
  echo 'For instance, eval $(op signin) before executing.'
  echo 'Will backup the local host to /arc/alpine-bak/.'
}

if ! op whoami 2>&1 > /dev/null; then
  echo "Unable to confirm that op (1password) is available."
  echo
  usage
  exit
fi

TARGET_HOST=$(/bin/hostname).$(/bin/dnsdomainname)
if [ -z ${TARGET_HOST} ]; then
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

BACKUPS_ROOT=/arc/alpine-bak/${TARGET_HOST}
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
  mkdir -p ${BACKUP_DIR}
fi
chmod 770 ${BACKUP_DIR}

# Preserve fstab and blkid output to ease reconstruction.
TARGET_FSTAB=${BACKUP_DIR}/fstab
cp /etc/fstab ${TARGET_FSTAB}
TARGET_BLKID=${BACKUP_DIR}/blkid-output
/sbin/blkid > ${TARGET_BLKID}

# Alpine "local backup"
DEFAULT_CIPHER=chacha20 PASSWORD=${PASSWORD} \
  LBU_BACKUPDIR=${BACKUP_DIR} doas /sbin/lbu commit

for UUID in $(< /etc/fstab /usr/bin/awk '/ext/ {print $1}'); do
  FILESYSTEM=$(< /etc/fstab awk "/${UUID}/"' {print $2}')
  BACKUP_OUTPUT=${BACKUP_DIR}/${UUID}.tar.lzo.chacha
  LOG_OUTPUT=${BACKUP_DIR}/${UUID}.log
  cp /dev/null ${LOG_OUTPUT}
  cp /dev/null ${BACKUP_OUTPUT}
  chmod 660 ${LOG_OUTPUT}
  chmod 660 ${BACKUP_OUTPUT}

  doas /bin/tar --one-file-system --exclude=/proc"*" --exclude=proc"*" \
      --create --file=- ${FILESYSTEM}| \
    lzop -1c 2>> ${LOG_OUTPUT} | \
    /usr/bin/openssl enc -chacha20 -iter 1000000 -k "${PASSWORD}" 2>> ${LOG_OUTPUT} \
    > ${BACKUP_OUTPUT}
done

doas touch ${BACKUP_DIR}
