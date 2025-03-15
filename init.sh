#!/bin/bash

sudo apt update
sudo apt upgrade


sudo apt install git make unzip gcc ripgrep -y

mkdir ~/setup & cd ~/setup

git clone http://github.com/JonathanWu1/dotfiles.git

sudo snap install ghostty --classic
cp ~/setup/dotfiles/config ~/.config/ghostty/

chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp ~/setup/dotfiles/.zshrc ~/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

export PROFILE=~/.zshrc
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash

nvm install 22

wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

sudo apt-get install -y dotnet-sdk-9.0
sudo apt-get install -y aspnetcore-runtime-9.0

sudo apt update
sudo apt upgrade
