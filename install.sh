mkfs.ext4 "$2"
mkfs.fat "$1"
mount "$2" /mnt
mount --mkdir "$1" /mnt/boot

pacstrap -K /mnt base linux linux-firmware nvim gdisk refind

genfstab -U /mnt >> /mnt/etc/fstab
curl -fsSL https://trenek.github.io/later.sh -o /mnt/install.sh
chmod 777 /mnt/install.sh

arch-chroot /mnt ./install.sh "$1" "$2"
