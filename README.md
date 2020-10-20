# iocage-plugin-spectrum-protect

This FreeBSD jail can be used to backup files to "IBM Spectrum Protect", formerly known as Tivoli Storage Manager (TSM). It imports an existing configuration und runs the scheduler.

Build for FreeNAS/TrueNAS, but should also work on other FreeBSD Systems.

This jail uses the linux client version of "IBM Spectrum Protect", so "linux_enable=YES" has to be set in `/etc/rc.conf` (Set via tunables in FreeNAS).

## Installation

```
git clone https://github.com/hejamu/iocage-plugin-spectrum-protect.git
cd iocage-plugin-spectrum-protect
./bootstrap.sh
```

IBM Spectrum Protect 8.1.10 will be installed in the jail.

## Configuration

### Config files

Set the mount points in bootstrap.sh so that
- `/compat/linux/etc/adsm` contains the password store files, namely `TSM.KDB`, `TSM.sth` and `TSM.IDX`. 
- `/compat/linux/etc/tsm` contains the preference files `dsm.sys`, `dsm.opt` (`dsmcert.idx`, `dsmcert.kdb` and `dsmcert.sth` if you're using SSL) and your localization folder (eg. EN_US). 

`DSM_DIR=/compat/linux/etc/tsm` will be set at scheduler start.

### Mount points

Change the existing mount points to your needs. The example takes the FreeNAS folders `/mnt/home` and `/mnt/gruppen` and mounts them to `/home` and `/gruppen` inside the jail.

Make sure that the folder you mount does not exist in `/compat/linux`, as the emulation layer will prioritize those paths. For example, if you mount your files to `/var`, TSM won't see them because `/var` is remapped to `/compat/linux/var` by the emulation layer.

