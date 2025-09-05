export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

unsetopt correct_all

# DISABLE_UNTRACKED_FILES_DIRTY="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="false"

plugins=(git; zsh-interactive-cd; zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

export PATH="${PATH}:/opt/nvim-linux-x86_64/bin"
export GCM_CREDENTIAL_STORE=gpg

bindkey '^h' backward-word
bindkey '^b' backward-kill-word
bindkey '^l' forward-word 
bindkey '^y' end-of-line 

export DOTNET_CLI_TELEMETRY_OPTOUT=1
export NVM_DIR="$HOME/.config/nvm"
export EDITOR="/opt/nvim-linux-x86_64/bin/nvim"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export TERMINAL=/snap/bin/ghostty

alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh/custom/"
alias aliasconfig="nvim ~/.oh-my-zsh/custom/aliases.zsh"
alias ghosttyconfig="nvim ~/.config/ghostty/config"
alias ghosttyupdate="cp ~/.config/ghostty/config ~/dotfiles/config"
alias vpn="sudo openvpn --config ~/.config/vpnconfig/vpnconfig.ovpn&"
alias nvimconfig="nvim ~/.config/nvim"
alias i3config="nvim ~/.config/i3/config"

alias hub="cd ~/cargonerds/cargonerds-hub/"
alias jarvis="cd ~/cargonerds/jarvis/"
alias reporting="cd ~/cargonerds/reporting/"
alias pm="cd ~/cargonerds/PricingManager/Frontend/"
alias tf="cd ~/cargonerds/cargonerds-hub-infrastructure/terraform/"
alias azd="cd ~/cargonerds/docker/azurite/data/"
alias aspire="cd ~/cargonerds/PricingManager/Backend/PricingManager.Aspire/PricingManager.Aspire.AppHost/"
