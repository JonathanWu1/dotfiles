sudo apt install zsh -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


cp ~/dotfiles/.zshrc ~
cp ~/dotfiles/ohmyzsh/path.sh ~/.oh-my-zsh/custom/
cp ~/dotfiles/ohmyzsh/aliases.sh ~/.oh-my-zsh/custom/
