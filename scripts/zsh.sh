#!/usr/bin/env bash
set -e

OMZ_GITHUB="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
ZSH_AUTOSUGGEST="https://github.com/zsh-users/zsh-autosuggestions"
ZSH_VI="https://github.com/jeffreytse/zsh-vi-mode"
PLUGIN_DIR="../configs/zsh/oh-my-zsh/custom/plugins"

if [[ $EUID -ne 0 ]]; then
    sudo -v
fi


echo "Removing old omz"
rm -rf $HOME/.oh-my-zsh 2>&1
rm -rf $HOME/.config/oh-my-zsh 2>&1

echo "Installing zsh"
sudo apt-get install zsh -y

echo "Installed zsh in $(which zsh)"
ZSH="$HOME/.config/oh-my-zsh" KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

mkdir -p $PLUGIN_DIR
if [ ! -d "$PLUGIN_DIR/zsh-autosuggestions" ]; then
    git clone $ZSH_AUTOSUGGEST "$PLUGIN_DIR/zsh-autosuggestions" > /dev/null
fi

if [ ! -d "$PLUGIN_DIR/zsh-vi-mode" ]; then
    git clone $ZSH_VI "$PLUGIN_DIR/zsh-vi-mode" > /dev/null
fi

rm ~/.zshrc
ln -s $HOME/dotfiles/configs/zsh/.zshrc $HOME/.zshrc
rm -rf $HOME/.config/oh-my-zsh/custom
ln -s $HOME/dotfiles/configs/zsh/oh-my-zsh/custom $HOME/.config/oh-my-zsh/custom
