pacman -S efibootmgr networkmanager network-manager-applet wireless_tools wpa_supplicant dialog mtools dosfstools base-devel linux-headers openssh sudo \
          nvidia-open nvidia-utils \
          xorg \
          lemurs `#display manager` \
          plasma `#desktop enviroment` \
          contour  `#terminal emulator` \
          qutebrowser `#web browser` \
          git tree-sitter-cli unzip wget fd xclip `#for nvim config` \
          sof-firmware alsa-utils `#for audio` \
          cmake ninja valgrind gnuplot `#random dev` \
          vulkan-icd-loader vulkan-headers vulkan-validation-layers vulkan-tools `#vulkan` \
          texlive `#latex` \
          vlc vlc-plugins-all `#vlc` \
          discord \
          power-profiles-daemon `#wiatraczki, bateria`

refind-install --usedefault "$1" --alldrivers
mkrlconf

systemctl enable lemurs.service
systemctl enable NetworkManager

blkid "$2" >> boot/refind_linux.conf
blkid "$1" >> boot/EFI/BOOT/refind.conf

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

su trenek
