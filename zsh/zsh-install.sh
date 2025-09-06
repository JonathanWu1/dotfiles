sudo rm -rf ~/.oh-my-zsh/
sudo apt install zsh -y

RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/jeffreytse/zsh-vi-mode $HOME/.oh-my-zsh/custom/plugins/zsh-vi-mode

cp $HOME/dotfiles/zsh/.zshrc $HOME/.zshrc

exec zsh

