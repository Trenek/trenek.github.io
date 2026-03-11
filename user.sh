timedatectl set-timezone Europe/Warsaw
git clone --branch 0.11 https://github.com/Trenek/nvim-config ~/.config/nvim

curl -fsSL https://trenek.github.io/.bashrc -o temp.bashrc
chmod temp.bashrc
./temp.bashrc >> ~/.bashrc
rm temp.bashrc
