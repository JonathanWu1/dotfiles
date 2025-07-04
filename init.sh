#!/bin/bash

sudo apt update
sudo apt upgrade

sudo apt install make unzip gcc ripgrep fzf xclip curl pass -y

sudo snap install nvim --classic -y
sudo snap install ghostty --classic -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


export PROFILE=~/.zshrc
