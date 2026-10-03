# #!/bin/bash

# global env vars
ln -sf $HOME/dotfiles/.profile $HOME/.profile
ln -sf $HOME/dotfiles/.profile $HOME/.zprofile
ln -sf $HOME/dotfiles/.profile $HOME/.bash_profile
ln -sf $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -sf $HOME/dotfiles/.ideavimrc $HOME/.ideavimrc

git config --global core.editor "nvim"

# locales
sudo sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
sudo sed -i 's/^#de_DE.UTF-8 UTF-8/de_DE.UTF-8 UTF-8/' /etc/locale.gen
sudo sed -i 's/^#ja_JP.UTF-8 UTF-8/ja_JP.UTF-8 UTF-8/' /etc/locale.gen

sudo locale-gen


mkdir -p $HOME/.config

for item in $CONFIGS_DIR/*; do
    echo "$item" $HOME/.config/"$(basename "$item")"
    ln -sf "$item" $HOME/.config/"$(basename "$item")"
done


sudo pacman -Sy brightnessctl cliphist docker docker-compose fzf ghostty hyprland hyprshutdown hyprpaper hyprpolkitagent keychain ly mako neovim networkmanager networkmanager-openvpn rofi thunar vivaldi waybar ttf-jetbrains-mono-nerd alsa-utils cargo-binstall clang code fd gnome-themes-extra otf-ipafont pavucontrol unzip wiremix zsh


sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl enable ly@tty1
sudo systemctl start NetworkManager


ZSH_VI_DIR=$CONFIGS_DIR/.oh-my-zsh/custom/plugins/zsh-vi-mode/
ZSH_AS_DIR=$CONFIGS_DIR/.oh-my-zsh/custom/plugins/zsh-autosuggestions/

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH_VI_DIR
cd $ZSH_VI_DIR 
git checkout tags/v0.12.0

git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_AS_DIR
cd $ZSH_AS_DIR
git checkout tags/v0.7.1


gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

git config --global credential.credentialStore gpg

curl -L https://dot.net/v1/dotnet-install.sh -o dotnet-install.sh
chmod +x dotnet-install.sh
./dotnet-install.sh
./dotnet-install.sh --channel 9.0
