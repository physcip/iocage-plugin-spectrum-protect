iocage fetch -P spectrum-protect.json

iocage stop spectrum-protect

# Change these to point to the data you want to backup
iocage fstab -a spectrum-protect '/mnt/home /home nullfs rw 0 0'
iocage fstab -a spectrum-protect '/mnt/gruppen /gruppen nullfs rw 0 0'

# Change these to point to the config files (see README.md)
iocage fstab -a spectrum-protect '/mnt/system/tsm-config/adsm /compat/linux/etc/adsm nullfs rw 0 0'
iocage fstab -a spectrum-protect '/mnt/system/tsm-config/tsm /compat/linux/etc/tsm nullfs rw 0 0'

iocage start spectrum-protect
