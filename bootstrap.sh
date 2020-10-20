#!/bin/sh

iocage fetch -P spectrum-protect.json


# Add a block for every mountpoint you need

###################

MOUNT_DIR=/mnt/home
MOUNT_JAIL=/home

iocage exec spectrum-protect "mkdir -p $MOUNT_JAIL"
iocage exec spectrum-protect 'echo "/dev'$MOUNT_JAIL' '$MOUNT_JAIL' nullfs rw 0 0" >> /compat/linux/etc/mtab'
iocage fstab -a spectrum-protect "$MOUNT_DIR $MOUNT_JAIL nullfs rw 0 0"

###################

MOUNT_DIR=/mnt/gruppen
MOUNT_JAIL=/gruppen

iocage exec spectrum-protect "mkdir -p $MOUNT_JAIL"
iocage exec spectrum-protect 'echo "/dev'$MOUNT_JAIL' '$MOUNT_JAIL' nullfs rw 0 0" >> /compat/linux/etc/mtab'
iocage fstab -a spectrum-protect "$MOUNT_DIR $MOUNT_JAIL nullfs rw 0 0"

###################


# Change these to point to the config files (see README.md)

iocage fstab -a spectrum-protect '/mnt/system/tsm-config/adsm /compat/linux/etc/adsm nullfs rw 0 0'
iocage fstab -a spectrum-protect '/mnt/system/tsm-config/tsm /compat/linux/etc/tsm nullfs rw 0 0'

###################

iocage restart spectrum-protect

