#!/bin/bash

/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2025.03.09_all.deb keyring.deb SHA256:2c2601e6053d5c68c2c60bcd088fa9797acec5f285151d46de9c830aaba6173c
sudo apt-get install ./keyring.deb -y
rm ./keyring.deb
echo "deb [signed-by=/usr/share/keyrings/sur5r-keyring.gpg] http://debian.sur5r.net/i3/ $(grep '^VERSION_CODENAME=' /etc/os-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
sudo apt-get update -y
sudo apt-get install i3 -y

rm -rf $HOME/.config/i3
ln -s $HOME/dotfiles/configs/i3 $HOME/.config/i3

rm -rf $HOME/.config/i3status
ln -s $HOME/dotfiles/configs/i3status $HOME/.config/i3status

sudo apt-get install polybar -y

rm -rf $HOME/.config/polybar
ln -s $HOME/dotfiles/configs/polybar $HOME/.config/polybar

sudo apt-get install rofi -y
rm -rf $HOME/.config/rofi
ln -s $HOME/dotfiles/configs/rofi $HOME/.config/rofi
