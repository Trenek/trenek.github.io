timedatectl set-timezone Europe/Warsaw
git clone --branch 0.11 https://github.com/Trenek/nvim-config ~/.config/nvim
curl -fsSL trenek.github.io/temp.bashrc >> ~/.bashrc

aurInstall() {
    sudo git clone "https://aur.archlinux.org/$1"
    sudo chmod 777 "$1"
    makepkg -sicD "$1"
    sudo rm -rf "$1"
}

aurInstall "google-chrome"
aurInstall "miktex"
aurInstall "xmount" # informatyka sledcza

sudo miktexsetup --shared=yes finish
kwriteconfig6 --file kwalletrc --group Wallet --key Enabled false

git config --global init.defaultBranch master

git config --global user.email "mateusz.sas@vp.pl"
git config --global user.name "Trenek"

ssh-keygen -t ed25519 -C "mateusz.sas@vp.pl"

source ~/.bashrc
