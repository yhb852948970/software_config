# 1. /etc/fstab 
This file stores all the mount file system when bootup.
# 2. burn a iso file to disk
```bash
dd if=DIR-TO-ISO of=/dev/sda1
```
# 3. place to find documents
/usr/share/doc
# 4. lsblk command to list all the partitions
# 5. blkid command to list teh uuid of each partition
# 6. To see the details of a filesystem
```bash
sudo parted /dev/sda print
```
# 7. Using gdisk to set partition
```bash
gdisk /dev/sda
```
# 8. mount
```bash
mount	UUID="899b755b-1da4-4d1d-9b1c-f762adb798e1"	/data/ext4
```
mount as a loop
```bash
mount	-o	loop	UUID="7dd97bd2-4446-48fd-9d23-a8b03ffdd5ee"	/mnt
```

# 9. using dd to create a "0" file
```bash
dd	if=/dev/zero	of=/srv/loopdev	bs=1M	count=512
```
