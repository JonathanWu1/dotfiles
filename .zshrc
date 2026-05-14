if [ -z "$CONFIGS_DIR" ]; then
    echo "No configs dir found"
    export CONFIGS_DIR="$HOME/dotfiles/.config"
fi

export ZSH="$CONFIGS_DIR/.oh-my-zsh"


ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME}/.local/share/shell"
ZSH_COMPDUMP="$ZSH_CACHE_DIR/.zcompdump"

mkdir -p "$ZSH_CACHE_DIR"
export HISTFILE="$ZSH_CACHE_DIR/.zsh_history"

autoload -Uz compinit
compinit -d "$ZSH_CACHE_DIR/zcompdump"

ZSH_THEME="robbyrussell"
unsetopt correct_all

# DISABLE_UNTRACKED_FILES_DIRTY="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="false"


#git clone https://github.com/zsh-users/zsh-autosuggestions
#git clone https://github.com/jeffreytse/zsh-vi-mode
plugins=(
    git 
    archlinux
    azure
    docker
    docker-compose
    dotnet
    npm
    zsh-interactive-cd 
    zsh-autosuggestions 
    zsh-vi-mode
)

function zvm_after_init() {
    bindkey -r -M vicmd '^Y'   # Unbind Ctrl+Y in normal mode
    bindkey -M viins '^Y' end-of-line
    ZVM_SYSTEM_CLIPBOARD_ENABLED=true
}

source $ZSH/oh-my-zsh.sh

FNM_PATH="/home/jonathanwu/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

export PATH="$PATH:$HOME/.local/share/fnm/aliases/default"
export PATH="$PATH:$HOME/.local/share/fnm/aliases/default/bin"
export SSH_HOME="$HOME/.local/share/ssh"

export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools


source $DOTFILES/scripts/aliases.zsh
export PATH="$HOME/.local/bin:$PATH"
export SSL_CERT_DIR=/etc/ssl/certs
export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt

# Added by get-aspire-cli.sh
export PATH="$HOME/.aspire/bin:$PATH"
export PATH="$HOME/.dotnet/tools/:$PATH"
export PATH="$HOME/source/azd-linux/:$PATH"


export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/share/git-credential-manager"


export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
