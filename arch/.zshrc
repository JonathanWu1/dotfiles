export ZSH="$XDG_CONFIG_HOME/oh-my-zsh/"

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

export GCM_CREDENTIAL_STORE="gpg"
export ZSH_CUSTOM="$HOME/.config/oh-my-zsh/custom"
export ZSH="$HOME/.config/oh-my-zsh/"
export PATH="$PATH:/opt/gcm:$HOME/.dotnet:$HOME/.dotnet/tools/"
export DOTNET_ROOT="$HOME/.dotnet"
source $ZSH/oh-my-zsh.sh

function zvm_after_init() {
    bindkey -r -M vicmd '^Y'   # Unbind Ctrl+Y in normal mode
    bindkey -M viins '^Y' end-of-line
}


# fnm
FNM_PATH="/home/jonathanwu/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi
