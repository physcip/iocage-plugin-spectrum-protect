#!/bin/sh

# Create mountpoints

# Change these to your DOMAINs
mkdir /home
mkdir /gruppen


mkdir /compat/linux/etc/adsm
mkdir /compat/linux/etc/tsm

# Add mountpoints to fstab

mkdir /compat/linux/proc/self
touch /compat/linux/proc/self/mounts

# Change these to your DOMAINs
echo "/dev/home /home nullfs rw 0 0" > /compat/linux/etc/mtab
echo "/dev/gruppen /gruppen nullfs rw 0 0" >> /compat/linux/etc/mtab

ln -s /compat/linux/etc/mtab /compat/linux/etc/fstab

# Download IBM Spectrum Protect (TSM) client 8.1.10

mkdir /compat/linux/tmp
cd /compat/linux/tmp
curl https://public.dhe.ibm.com/storage/tivoli-storage-management/maintenance/client/v8r1/Linux/LinuxX86/BA/v8110/8.1.10.0-TIV-TSMBAC-LinuxX86.tar --output 8.1.10.0-TIV-TSMBAC-LinuxX86.tar
tar xvf 8*-TIV-TSMBAC-LinuxX86.tar

# Install 

cd /compat/linux

rpm2cpio < /compat/linux/tmp/gskcrypt64-8.0.55.14.linux.x86_64.rpm | cpio -id
rpm2cpio < /compat/linux/tmp/gskssl64-8.0.55.14.linux.x86_64.rpm  | cpio -id
rpm2cpio < /compat/linux/tmp/TIVsm-API64.x86_64.rpm  | cpio -id
rpm2cpio < /compat/linux/tmp/TIVsm-BA.x86_64.rpm  | cpio -id

# cleanup

rm -r /compat/linux/tmp 

# Link missing libraries

ln -s /compat/linux/opt/tivoli/tsm/client/api/bin64/libgpfs.so /compat/linux/usr/lib64/libgpfs.so
ln -s /compat/linux/opt/tivoli/tsm/client/api/bin64/libdmapi.so  /compat/linux/usr/lib64/libdmapi.so
ln -s /compat/linux/usr/local/ibm/gsk8_64/lib64/libgsk8ssl_64.so /compat/linux/usr/lib64/libgsk8ssl_64.so
ln -s /compat/linux/usr/local/ibm/gsk8_64/lib64/libgsk8iccs_64.so  /compat/linux/usr/lib64/libgsk8iccs_64.so
ln -s /compat/linux/usr/local/ibm/gsk8_64/lib64/libgsk8km_64.so  /compat/linux/usr/lib64/libgsk8km_64.so
ln -s /compat/linux/usr/local/ibm/gsk8_64/lib64/libgsk8cms_64.so  /compat/linux/usr/lib64/libgsk8cms_64.so

# Disabling unused system processes

echo 'syslogd_enable="NO"' >> /etc/rc.conf
echo 'cron_enable="NO"' >> /etc/rc.conf
