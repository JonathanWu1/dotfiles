export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

unsetopt correct_all

# DISABLE_UNTRACKED_FILES_DIRTY="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="false"

plugins=(
    git 
    zsh-interactive-cd 
    zsh-autosuggestions 
    zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh
export PATH="${PATH}:/snap/nvim/current/usr/bin/nvim"
export XDG_DATA_DIRS="$HOME/.local/share/applications/"
export GCM_CREDENTIAL_STORE="gpg"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export NVM_DIR="$HOME/.config/nvm"
export EDITOR="/snap/nvim/current/usr/bin/nvim"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# fnm
FNM_PATH="/home/jonathanwu/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi


function zvm_after_init() {
    bindkey -r -M vicmd '^Y'   # Unbind Ctrl+Y in normal mode
    bindkey -M viins '^Y' end-of-line
}

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
