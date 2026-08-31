aurInstall() {
    sudo git clone "https://aur.archlinux.org/$1"
    sudo chmod 777 "$1"
    makepkg -sicD "$1"
    sudo rm -rf "$1"
}

aurInstall "google-chrome"
aurInstall "miktex"
aurInstall "grub-theme-minegrub-world-selection-git"

# informatyka śledcza
aurInstall "xmount"
aurInstall "scalpel-git"

wget https://github.com/MrVivekRajan/Grub-Themes/releases/download/Aesthetic-Theme/Aesthetic.tar.gz
sudo tar -xf Aesthetic.tar.gz --no-same-owner -C /boot/grub/themes/
sudo rm ./Aesthetic.tar.gz
sudo echo "GRUB_THEME=/boot/grub/themes/minegrub-world-selection/theme.txt" | sudo tee -a /etc/default/grub

sudo grub-mkconfig -o /boot/grub/grub.cfg

bash -c "$(curl -fsSL https://raw.githubusercontent.com/keyitdev/sddm-astronaut-theme/master/setup.sh)"

sudo miktexsetup --shared=yes finish
kwriteconfig6 --file kwalletrc --group Wallet --key Enabled false

git config --global init.defaultBranch master

git config --global user.email "mateusz.sas@vp.pl"
git config --global user.name "Trenek"

ssh-keygen -t ed25519 -C "mateusz.sas@vp.pl"

source ~/.bashrc
