mkfs.ext4 "$2"
mkfs.fat "$1"
mount "$2" /mnt
mount --mkdir "$1" /mnt/boot

pacstrap -K /mnt base linux linux-firmware nvim gdisk refind

genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
