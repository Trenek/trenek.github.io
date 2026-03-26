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

sudo miktexsetup --shared=yes finish
kwriteconfig6 --file kwalletrc --group Wallet --key Enabled false

git config --global init.defaultBranch master

source ~/.bashrc
