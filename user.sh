sudo timedatectl set-timezone Europe/Warsaw
git clone --branch 0.11 https://github.com/Trenek/nvim-config ~/.config/nvim
curl -fsSL trenek.github.io/temp.bashrc >> ~/.bashrc

sudo git clone https://aur.archlinux.org/google-chrome
sudo chmod 777 google-chrome
makepkg -sicD google-chrome
sudo rm -rf google-chrome

source ~/.bashrc
