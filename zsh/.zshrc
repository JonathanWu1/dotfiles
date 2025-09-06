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
