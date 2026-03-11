timedatectl set-timezone Europe/Warsaw
git clone --branch 0.11 https://github.com/Trenek/nvim-config ~/.config/nvim

curl -fsSL trenek.github.io/temp.bashrc -o temp.bashrc
chmod 777 temp.bashrc
./temp.bashrc >> ~/.bashrc
rm temp.bashrc
