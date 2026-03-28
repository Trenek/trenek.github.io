pacman -S efibootmgr base-devel linux-headers openssh sudo \
          mtools `#FAT, MS-DOS, Vfat` \
          dosfstools `#FAT management (mkfs.fat, fsck.fat, fatlabel)` \
          networkmanager network-manager-applet wireless_tools wpa_supplicant dialog `#network things` \
          nvidia-open nvidia-utils \
          xorg \
          lemurs `#display manager (login screen)` \
          plasma `#desktop enviroment` \
          dolphin `#file explorer` \
          kitty  `#terminal emulator` \
          power-profiles-daemon `#wiatraczki, bateria` \
          sof-firmware alsa-utils `#for audio` \
          git tree-sitter-cli unzip wget fd xclip `#for nvim config` \
          cmake ninja valgrind gnuplot `#random dev` \
          vulkan-icd-loader vulkan-headers vulkan-validation-layers vulkan-tools `#vulkan` \
          vlc vlc-plugins-all `#vlc` \
          l3afpad `#notatnik`
          noto-fonts-cjk noto-fonts-emoji noto-fonts `#some multilingual fonts` \
          7zip \
          ghc haskell-language-server `#haskell` \
          discord

refind-install --usedefault "$1" --alldrivers
mkrlconf

systemctl enable lemurs.service
systemctl enable NetworkManager

echo -n "UUID=$(sudo blkid $2 -s UUID -o value)\"" >> boot/refind_linux.conf
echo -n "UUID=$(sudo blkid $1 -s UUID -o value)" >> boot/EFI/BOOT/refind.conf

"the-real-mandarynka" >> etc/hostname
useradd -mG wheel trenek

echo "Give Root Password"
passwd
echo "Give Trenek Password"
passwd trenek

nvim boot/refind_linux.conf
nvim boot/EFI/BOOT/refind.conf

EDITOR=nvim visudo

curl -fsSL https://trenek.github.io/user.sh -o user.sh
chmod 777 user.sh

su trenek -c "./user.sh"
