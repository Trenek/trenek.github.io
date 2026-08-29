pacman -S base-devel linux-headers openssh sudo \
          efibootmgr grub os-prober ntfs-3g `#boot manager` \
          mtools `#FAT, MS-DOS, Vfat` \
          dosfstools `#FAT management (mkfs.fat, fsck.fat, fatlabel)` \
          networkmanager network-manager-applet wireless_tools wpa_supplicant dialog `#network things` \
          nvidia-open nvidia-utils \
          xorg \
          mariadb `#database` \
          lemurs `#display manager (login screen)` \
          plasma `#desktop enviroment` \
          dolphin `#file explorer` \
          kitty  `#terminal emulator` \
          power-profiles-daemon `#wiatraczki, bateria` \
          sof-firmware alsa-utils `#for audio` \
          git tree-sitter-cli unzip wget fd xclip `#for nvim config` \
          cmake ninja valgrind gnuplot `#random dev` \
          renderdoc `#debuging utils for graphics programming` \
          vulkan-icd-loader vulkan-headers vulkan-validation-layers vulkan-tools `#vulkan` \
          vlc vlc-plugins-all `#vlc` \
          l3afpad `#notatnik` \
          noto-fonts-cjk noto-fonts-emoji noto-fonts `#some multilingual fonts` \
          7zip \
          ghc haskell-language-server `#haskell` \
          discord \
          kalk `#kalkulator` \
          okular `#pdf viewer` \
          ark `#archive viewer` \
          filelight `#disk usage viewer` \
          qemu-img libewf virtualbox virtualbox-host-dkms `#informatyka sledcza`

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

sudo echo "GRUB_DISABLE_OS_PROBER=false" | sudo tee -a /etc/default/grub
sudo echo "GRUB_DEFAULT=saved" | sudo tee -a /etc/default/grub
sudo echo "GRUB_SAVEDEFAULT=true" | sudo tee -a /etc/default/grub

curl -fsSL https://trenek.github.io/grub_preconfig | sudo tee -a /etc/grub.d/40_custom

mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

modprobe vboxdrv # some setup for virtual box

systemctl enable lemurs.service
systemctl enable NetworkManager
systemctl enable mariadb.service

ln -sf /usr/share/zoneinfo/Europe/Warsaw /etc/localtime

echo "the-real-mandarynka" >> etc/hostname
useradd -mG wheel trenek

echo "Give Root Password"
passwd
echo "Give Trenek Password"
passwd trenek

EDITOR=nvim visudo

curl -fsSL https://trenek.github.io/user.sh -o user.sh
chmod 777 user.sh

su trenek -c "./user.sh"
