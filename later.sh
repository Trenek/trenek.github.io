pacman -Sy efibootmgr networkmanager network-manager-applet wireless_tools wpa_supplicant dialog mtools dosfstools base-devel linux-headers openssh sudo
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

pacman -Sy nvidia-open nvidia-utils
pacman -Sy xorg

# display manager
sudo pacman -S sddm
sudo systemctl enable sddm

# desktop enviroment
sudo pacman -S plasma kde-applications xdg-user-dirs packagekit-qt6

# for nvim config
sudo pacman -S git tree-sitter-cli unzip wget fd xclip

# random dev
sudo pacman -S cmake ninja valgrind gnuplot

# vulkan
sudo pacman -S vulkan-icd-loader vulkan-headers vulkan-validation-layers vulkan-tools

# latex
sudo pacman -S texlive

# vlc
sudo pacman -S vlc vlc-plugins-all
