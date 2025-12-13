#!/bin/bash
set -e
sudo -v

echo "Running Update/Upgrade"
sudo apt-get update > /dev/null
sudo apt-get upgrade > /dev/null
sudo apt-get autoremove -y > /dev/null


packages=(make unzip gcc ripgrep fzf xclip curl pass gpg)
sudo apt-get install "${packages[@]}" -y > /dev/null

for pkg in "${packages[@]}"; do
    echo "Installed $pkg"
    sudo apt-get install $pkg -y > /dev/null
    printf "\033[1A"
    if [[ "$pkg" == "ripgrep" ]]; then
        echo "Installed $pkg in $(which rg)"
    else
        echo "Installed $pkg in $(which $pkg)"
    fi
done

echo "Installing fnm"
curl -fsSL https://fnm.vercel.app/install | zsh > /dev/null
printf "\033[1A"
echo "Installed fnm"

echo "Installing neovim"
sudo snap install nvim --classic > /dev/null
printf "\033[1A"
echo "Installed neovim"


echo "Installing ghostty"
sudo snap install ghostty --classic > /dev/null
printf "\033[1A"
echo "Installed ghostty"


echo "Installing 1password"
chmod +x ./1password.sh > /dev/null
./1password.sh > /dev/null
printf "\033[1A"
echo "Installed 1password"


echo "Installing zsh"
chmod +x ./zsh/zsh-install.sh > /dev/null
./zsh/zsh-install.sh > /dev/null
printf "\033[1A"
echo "Installed zsh"








