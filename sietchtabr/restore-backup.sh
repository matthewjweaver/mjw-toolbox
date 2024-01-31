#!/bin/sh
set -ex
umask 027

# TODO(mjw)
#   1. make work via an openbsd ramdisk kernel
#   1. maybe make this not such a giant footgun?

# This entire thing depends on the 1password CLI, op.

# Since the OpenBSD ramdisk doesn't have either ssh or libressl on it, I
# couldn't figure out a praxis for restoring using only the ramdisk.
# Therefore, this script has a few prerequisites:
#   1. The target system disk exists as /dev/sd1
#   2. The target system disk has sufficient size to support the backed
#   up disklabel.
#   3. The target system backup is the same OpenBSD version as the
#   system performing the restore.
#
# In general, the assumption is that this script is run on a host like
# axlotl-tank.int.nodeless.net, with the target disk as sd1.


usage() {
  echo "Usage:"
  echo "  restore-backup.sh <hostname> <backup number> <target disk>"
  echo
  echo "Example:"
  echo "  restore-backup.sh korba.nodeless.net num-1 sd1"
  echo
  echo "Requires authenticated 1password."
  echo 'For instance, eval $(op signin) before executing.'
}

if ! op whoami 2>&1 > /dev/null; then
  echo "ERROR: Unable to confirm that op (1password) is available."
  usage
  exit 1
fi

TARGET_HOST=${1}
if [ -z ${TARGET_HOST} ]; then
  usage
  exit 1
fi

# We assume the machine is a more or less new install, with only a root
# user.
TARGET_USER=root

PASSWORD=$(op read op://Personal/${TARGET_HOST}/dump-chacha-key)
if [ -z ${PASSWORD} ]; then
  echo "ERROR: Cannot find encryption password for target host using op."
  echo
  usage
  exit 1
fi

BACKUPS_ROOT=/arc/obsd-bak/dumps/${TARGET_HOST}
if ! [ -d ${BACKUPS_ROOT} ]; then
  echo "ERROR: ${BACKUPS_ROOT} doesn't exist, exiting."
  echo
  usage()
  exit 1
fi

BACKUP_DIR=${BACKUPS_ROOT}/lvl-0-${2}
if ! [ -d ${BACKUP_DIR} ]; then
  echo "ERROR: ${BACKUP_DIR} doesn't exist, exiting."
  echo "available backups:"
  ls ${BACKUPS_ROOT}
  echo
  usage()
  exit 1
fi

DISKLABEL=${BACKUP_DIR}/disklabel-*
if ! [ -f ${DISKLABEL} ]; then
  echo "ERROR: ${DISKLABEL} doesn't exist, exiting."
  echo
  usage()
  exit 1
fi

TARGET_DISK=${3}
if ! [ -z $(doas /sbin/mount|grep ${TARGET_DISK}) ]; then
  echo "ERROR: It appears ${TARGET_DISK} is mounted."
  echo
  usage()
  exit 1
fi

if ! [ -z $(doas /sbin/mount|grep /mnt) ]; then
  echo "ERROR: It appears /mnt is mounted."
  echo
  usage()
  exit 1
fi

# OK, from here out we are shooting without looking further.

doas /sbin/fdisk -i ${TARGET_DISK}
doas /sbin/disklabel -R ${TARGET_DISK} ${DISKLABEL}

# A grand assumption here is that / is partition a every time, and
# therefore comes first!
for DUMP in $(ls ${BACKUP_DIR}/*chacha); do
  DUID_PARTITION=$(basename ${DUMP} .dump.gz.chacha)
  TARGET_DIR=$(< ${BACKUP_DIR}/fstab awk "/${DUID_PARTITION}/ {print "'$2}')
  # Strip the disk uuid from the partition
  PARTITION=$(echo ${DUID_PARTITION}|sed -e's/[^.]*[.]//g')
  OLD_DUID=$(echo ${DUID_PARTITION}|sed -e's/[.].*//g')
  echo "Restoring ${DUMP} to ${TARGET_DIR}."
  doas /sbin/newfs /dev/r${TARGET_DISK}${PARTITION}
  doas /sbin/mount /dev/${TARGET_DISK}${PARTITION} /mnt${TARGET_DIR}
  cd /mnt${TARGET_DIR}
  < $DUMP /usr/bin/openssl enc -d -chacha -iter 1000000 -k "${PASSWORD}" |\
    /usr/bin/gunzip - |\
    doas /sbin/restore ryf -
done

NEW_DUID=$(doas disklabel ${TARGET_DISK}|awk '/duid/ {print $2}')
doas /usr/bin/sed -ie "s/${OLD_DUID}/${NEW_DUID}/g" /mnt/etc/fstab
doas /usr/sbin/installboot -vr /mnt ${TARGET_DISK}


