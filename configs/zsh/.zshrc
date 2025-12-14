ZSH_THEME="robbyrussell"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export PATH="${PATH}:/snap/nvim/current/usr/bin/nvim"
export XDG_DATA_DIRS="$HOME/.local/share/applications/"
export GCM_CREDENTIAL_STORE="gpg"
export EDITOR="/snap/nvim/current/usr/bin/nvim"
export ZSH_CUSTOM="$HOME/.config/oh-my-zsh/custom"

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

export ZSH="$HOME/.config/oh-my-zsh/"
source $ZSH/oh-my-zsh.sh

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
