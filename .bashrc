#
# ~/.bashrc
#
export HISTFILE="$HOME/.local/share/shell/.bash_history"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '


alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

export SSH_HOME="$HOME/.local/share/ssh"


export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

