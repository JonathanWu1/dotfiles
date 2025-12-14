#!/bin/bash
set -e
sudo -v

CLEAR="\033[1A\033[2K"

echo "Running Update/Upgrade"
sudo apt-get update > /dev/null
sudo apt-get upgrade > /dev/null
sudo apt-get autoremove -y > /dev/null

rm $HOME/.profile
ln -s $HOME/dotfiles/configs/.profile $HOME/.profile

packages=(make unzip gcc ripgrep fzf xclip curl pass gpg)
sudo apt-get install "${packages[@]}" -y > /dev/null

for pkg in "${packages[@]}"; do
    echo "Installed $pkg"
    sudo apt-get install $pkg -y > /dev/null
    printf $CLEAR
    if [[ "$pkg" == "ripgrep" ]]; then
        echo "Installed $pkg in $(which rg)"
    else
        echo "Installed $pkg in $(which $pkg)"
    fi
done

echo "Installing neovim"
sudo snap install nvim --classic > /dev/null
git clone https://github.com/jonathanwu1/nvim ~/.config/nvim > /dev/null 2>&1
printf $CLEAR
echo "Installed neovim"



echo "Installing ghostty"
sudo snap install ghostty --classic > /dev/null
rm -rf $HOME/.config/ghostty
ln -s $HOME/dotfiles/configs/ghostty $HOME/.config/ghostty
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /snap/bin/ghostty 0 > /dev/null
sudo update-alternatives --set x-terminal-emulator /snap/bin/ghostty > /dev/null
printf $CLEAR
echo "Installed ghostty"

echo "Installing 1password"
chmod +x ./scripts/1password.sh > /dev/null
./scripts/1password.sh > /dev/null 2>&1
printf $CLEAR
echo "Installed 1password"

echo "Installing zsh"
chmod +x ./scripts/zsh.sh > /dev/null
./scripts/zsh.sh > /dev/null
printf $CLEAR
echo "Installed zsh"

echo "Installing fnm"
curl -fsSL https://fnm.vercel.app/install | zsh > /dev/null
printf $CLEAR
echo "Installed fnm"
