pacman -S efibootmgr networkmanager network-manager-applet wireless_tools wpa_supplicant dialog mtools dosfstools base-devel linux-headers openssh sudo \
          nvidia-open nvidia-utils \
          xorg \
          sddm  `#display manager` \
          plasma kde-applications xdg-user-dirs packagekit-qt6 `#desktop enviroment` \
          git tree-sitter-cli unzip wget fd xclip `#for nvim config` \
          sof-firmware alsa-utils `#for audio` \
          cmake ninja valgrind gnuplot `#random dev` \
          vulkan-icd-loader vulkan-headers vulkan-validation-layers vulkan-tools `#vulkan` \
          texlive `#latex` \
          vlc vlc-plugins-all `#vlc` \
          power-profiles-daemon '#wiatraczki, bateria'

git clone --branch 0.11 https://github.com/Trenek/nvim-config ~/.config/nvim
curl -fsSL https://trenek.github.io/.bashrc -o temp.bashrc
temp.bashrc >> ~/.bashrc

refind-install --usedefault "$1" --alldrivers
mkrlconf

systemctl enable sddm
systemctl enable NetworkManager

blkid "$2" >> boot/refind_linux.conf
blkid "$1" >> boot/EFI/BOOT/refind.conf
# nvim boot/refind_linux.conf
# nvim boot/EFI/BOOT/refind.conf

# nvim etc/hostname
# passwd

# useradd -mG wheel trenek
# passwd trenek

# EDITOR=nvim visudo
#     uncomment wheel

timedatectl set-timezone Europe/Warsaw
