timedatectl set-timezone Europe/Warsaw
git clone --branch 0.11 https://github.com/Trenek/nvim-config ~/.config/nvim
curl -fsSL trenek.github.io/temp.bashrc >> ~/.bashrc

git clone https://aur.archlinux.org/google-chrome
makepkg -sicD google-chrome
rm -rf google-chrome

source ~/.bashrc
