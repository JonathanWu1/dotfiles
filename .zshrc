ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME}/.local/share/shell"
mkdir -p "$ZSH_CACHE_DIR"
export ZSH="$HOME/.oh-my-zsh"
export HISTFILE="$ZSH_CACHE_DIR/.zsh_history"

autoload -Uz compinit
compinit -d "$ZSH_CACHE_DIR/zcompdump"

ZSH=$HOME/.oh-my-zsh
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
}

FNM_PATH="/home/jonathanwu/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

export PATH="$PATH:$HOME/.local/share/fnm/aliases/default"
export PATH="$PATH:$HOME/.local/share/fnm/aliases/default/bin"
export SSH_HOME="$HOME/.local/share/ssh"
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools


source $ZSH/oh-my-zsh.sh
source $HOME/scripts/aliases.zsh
export PATH="$HOME/.local/bin:$PATH"
export SSL_CERT_DIR=/etc/ssl/certs
export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt

# Added by get-aspire-cli.sh
export PATH="$HOME/.aspire/bin:$PATH"
export PATH="$HOME/.dotnet/tools/:$PATH"
export PATH="$HOME/source/azd-linux/:$PATH"
