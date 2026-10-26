aurInstall() {
    sudo git clone "https://aur.archlinux.org/$1"
    sudo chmod 777 "$1"
    makepkg -sicD "$1"
    sudo rm -rf "$1"
}

aurInstall "google-chrome"
aurInstall "miktex"
aurInstall "grub-theme-minegrub-world-selection-git"

sh ./grub-theme-minegrub-world-selection-git/install.sh
sudo echo "GRUB_THEME=/boot/grub/themes/minegrub-world-selection/theme.txt" | sudo tee -a /etc/default/grub

sudo grub-mkconfig -o /boot/grub/grub.cfg

sudo miktexsetup --shared=yes finish
kwriteconfig6 --file kwalletrc --group Wallet --key Enabled false

git config --global init.defaultBranch master

git config --global user.email "mateusz.sas@vp.pl"
git config --global user.name "Trenek"

ssh-keygen -t ed25519 -C "mateusz.sas@vp.pl"

source ~/.bashrc
