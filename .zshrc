export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# DISABLE_UNTRACKED_FILES_DIRTY="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"

plugins=(git; zsh-interactive-cd; zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

export PATH="${PATH}:/opt/nvim-linux-x86_64/bin"

bindkey '^h' backward-kill-word
bindkey '^l' forward-word 
bindkey '^y' end-of-line 

export DOTNET_CLI_TELEMETRY_OPTOUT=1
export NVM_DIR="$HOME/.config/nvm"
export EDITOR="/opt/nvim-linux-x86_64/bin/nvim"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
