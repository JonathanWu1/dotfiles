#!/bin/bash

ZSH_VI_DIR=$CONFIGS_DIR/.oh-my-zsh/custom/plugins/zsh-vi-mode/
ZSH_AS_DIR=$CONFIGS_DIR/.oh-my-zsh/custom/plugins/zsh-autosuggestions/

echo "Setup vars"


echo "configs: " $CONFIGS_DIR
echo "zsh-vi-mode: "$ZSH_VI_DIR
echo "zsh-autosuggestions: "$ZSH_AS_DIR

sudo ln -s ./.profile $HOME/.profile
sudo ln -s ./.profile $HOME/.zprofile

sudo sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
sudo sed -i 's/^#ja_JP.UTF-8 UTF-8/ja_JP.UTF-8 UTF-8/' /etc/locale.gen
sudo locale-gen

for item in $CONFIGS_DIR/*; do
    echo $item
    sudo rm -rf "$HOME/.config/$(basename "$item")"
    echo "$item" $HOME/.config/"$(basename "$item")"
    ln -sf "$item" $HOME/.config/"$(basename "$item")"
done

sudo pacman -S $(< packages.txt)

git config --global core.editor "nvim"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH_VI_DIR
cd $ZSH_VI_DIR 
git checkout tags/v0.12.0

git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_AS_DIR
cd $ZSH_AS_DIR
git checkout tags/v0.7.1


curl -fsSL https://fnm.vercel.app/install | bash
fnm install --latest
sudo ln -s ~/.local/share/fnm/aliases/latest/bin/node /bin/node
sudo ln -s ~/.local/share/fnm/aliases/latest/bin/npm /bin/npm


sudo systemctl enable docker
sudo systemctl start docker

gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'


git config --global credential.credentialStore gpg

ln -s dotfiles/.ideavimrc .ideavimrc

curl -L https://dot.net/v1/dotnet-install.sh -o dotnet-install.sh
chmod +x dotnet-install.sh
./dotnet-install.sh
./dotnet-install.sh --channel 9.0
