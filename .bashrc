#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export HISTFILE="$HOME/.local/share/shell/.bash_history"

alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# fnm
FNM_PATH="/home/jonathanwu/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi
export PATH="$PATH:$HOME/.local/share/fnm/aliases/default"
export SSH_HOME="$HOME/.local/share/ssh"


export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools
