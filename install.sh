mkfs.ext4 "$2"
mkfs.fat "$1"
mount "$2" /mnt
mount --mkdir "$1" /mnt/boot

pacstrap -K /mnt base linux linux-firmware nvim gdisk refind

genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt

pacman -S efibootmgr networkmanager network-manager-applet wireless_tools wpa_supplicant dialog mtools dosfstools base-devel linux-headers openssh sudo
refind-install --usedefault "$1" --alldrivers
mkrlconf

systemctl enable NetworkManager

# nvim etc/hostname
# passwd
# 
# nvim boot/refind_linux.conf
# nvim boot/EFI/BOOT/refind.conf

# useradd -mG wheel trenek
# passwd trenek

# EDITOR=nvim visudo
#     uncomment wheel
