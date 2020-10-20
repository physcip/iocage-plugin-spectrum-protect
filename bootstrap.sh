iocage fetch -P spectrum-protect.json

iocage stop spectrum-protect

iocage fstab -a spectrum-protect '/mnt/home /home nullfs rw 0 0'
iocage fstab -a spectrum-protect '/mnt/gruppen /gruppen nullfs rw 0 0'
iocage fstab -a spectrum-protect '/mnt/freenasswap/iocage/templates/adsm /compat/linux/etc/adsm nullfs rw 0 0'
iocage fstab -a spectrum-protect '/mnt/freenasswap/iocage/templates/tsm /compat/linux/etc/tsm nullfs rw 0 0'

iocage start spectrum-protect
