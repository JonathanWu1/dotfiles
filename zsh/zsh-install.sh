#!/usr/bin/env bash
set -e

OMZ_GITHUB="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
ZSH_AUTOSUGGEST="https://github.com/zsh-users/zsh-autosuggestions"
ZSH_VI="https://github.com/jeffreytse/zsh-vi-mode"
PLUGIN_DIR="$HOME/.oh-my-zsh/custom/plugins/"

if [[ $EUID -ne 0 ]]; then
    sudo -v
fi

echo "Removing old omz"
rm -rf $HOME/.oh-my-zsh 2>&1

echo "Installing zsh"
sudo apt-get install zsh -y > /dev/null 2>&1

echo "Installed zsh in $(which zsh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended > /dev/null 2>&1

git clone $ZSH_AUTOSUGGEST "$PLUGIN_DIR/zsh-autosuggestions" > /dev/null 2>&1
git clone $ZSH_VI "$PLUGIN_DIR/zsh-vi-mode" > /dev/null 2>&1

cp $HOME/dotfiles/zsh/.zshrc $HOME/.zshrc

exec zsh

