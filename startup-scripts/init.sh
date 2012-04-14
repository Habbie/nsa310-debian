#!/bin/sh
case "$1" in
        start|startup)
                mount --bind /proc /etc/zyxel/storage/sysvol/.debian/root/proc
                mount --bind /sys /etc/zyxel/storage/sysvol/.debian/root/sys
                mount -t devpts none /etc/zyxel/storage/sysvol/.debian/root/dev/pts
                mount --bind /etc/zyxel/storage/sysvol /etc/zyxel/storage/sysvol/.debian/root/data
                cp /etc/resolv.conf /etc/zyxel/storage/sysvol/.debian/root/etc
                chroot /etc/zyxel/storage/sysvol/.debian/root /etc/init.d/ssh start
                ;;
        stop|shutdown)
                umount /etc/zyxel/storage/sysvol/.debian/root/proc
                umount /etc/zyxel/storage/sysvol/.debian/root/sys
                umount /etc/zyxel/storage/sysvol/.debian/root/dev/pts
                umount /etc/zyxel/storage/sysvol /etc/zyxel/storage/sysvol/.debian/root/data
                chroot /etc/zyxel/storage/sysvol/.debian/root /etc/init.d/ssh stop
                ;;                              
        *)
                exit 0
                ;;              
esac

exit 0
