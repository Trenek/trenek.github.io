pacman -S efibootmgr networkmanager network-manager-applet wireless_tools wpa_supplicant dialog mtools dosfstools base-devel linux-headers openssh sudo \
          nvidia-open nvidia-utils \
          xorg \
          sddm  `#display manager` \
          plasma kde-applications xdg-user-dirs packagekit-qt6 `#desktop enviroment` \
          git tree-sitter-cli unzip wget fd xclip `#for nvim config` \
          cmake ninja valgrind gnuplot `#random dev` \
          vulkan-icd-loader vulkan-headers vulkan-validation-layers vulkan-tools `#vulkan` \
          texlive `#latex` \
          vlc vlc-plugins-all `#vlc`
          
refind-install --usedefault "$1" --alldrivers
mkrlconf

systemctl enable sddm
systemctl enable NetworkManager

# nvim etc/hostname
# passwd
# 
# USE blkid, 
# nvim boot/refind_linux.conf
# nvim boot/EFI/BOOT/refind.conf

# useradd -mG wheel trenek
# passwd trenek

# EDITOR=nvim visudo
#     uncomment wheel
