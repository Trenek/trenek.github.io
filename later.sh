pacman -Sy efibootmgr networkmanager network-manager-applet wireless_tools wpa_supplicant dialog mtools dosfstools base-devel linux-headers openssh sudo --noconfirm
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

pacman -Sy nvidia-open nvidia-utils --noconfirm
pacman -Sy xorg --noconfirm

# display manager
pacman -Sy sddm --noconfirm
systemctl enable sddm

# desktop enviroment
pacman -Sy plasma kde-applications xdg-user-dirs packagekit-qt6 --noconfirm

# for nvim config
pacman -Sy git tree-sitter-cli unzip wget fd xclip --noconfirm

# random dev
pacman -Sy cmake ninja valgrind gnuplot --noconfirm

# vulkan
pacman -Sy vulkan-icd-loader vulkan-headers vulkan-validation-layers vulkan-tools --noconfirm

# latex
pacman -Sy texlive --noconfirm

# vlc
pacman -Sy vlc vlc-plugins-all --noconfirm
