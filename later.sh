pacman -S efibootmgr networkmanager network-manager-applet wireless_tools wpa_supplicant dialog mtools dosfstools base-devel linux-headers openssh sudo \
          nvidia-open nvidia-utils \
          xorg \
          sddm  `#display manager` \
          lxqt breeze-icons `plasma kde-applications xdg-user-dirs packagekit-qt6` `#desktop enviroment` \
          git tree-sitter-cli unzip wget fd xclip `#for nvim config` \
          sof-firmware alsa-utils `#for audio` \
          cmake ninja valgrind gnuplot `#random dev` \
          vulkan-icd-loader vulkan-headers vulkan-validation-layers vulkan-tools `#vulkan` \
          texlive `#latex` \
          vlc vlc-plugins-all `#vlc` \
          power-profiles-daemon `#wiatraczki, bateria`

refind-install --usedefault "$1" --alldrivers
mkrlconf

systemctl enable sddm
systemctl enable NetworkManager

blkid "$2" >> boot/refind_linux.conf
blkid "$1" >> boot/EFI/BOOT/refind.conf

"the-real-mandarynka" >> etc/hostname
useradd -mG wheel trenek

echo "Give Root Password"
passwd

nvim boot/refind_linux.conf
nvim boot/EFI/BOOT/refind.conf

EDITOR=nvim visudo

curl -fsSL https://trenek.github.io/user.sh -o /mnt/user.sh
chmod 777 /mnt/user.sh

su trenek
