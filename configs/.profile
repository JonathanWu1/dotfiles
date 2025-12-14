# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export TERMINAL="/snap/bin/ghostty"
export XCURSOR_SIZE=30

xinput --set-prop "pointer:Logitech G502" "libinput Accel Speed" -0.5
xrandr --output DisplayPort-1 --right-of DisplayPort-0
xrandr --output DisplayPort-6 --left-of DisplayPort-0 --rotate left
export XDG_DATA_DIRS="$HOME/.local/share/applications/"

export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"
export PATH="${PATH}:/snap/nvim/current/usr/bin/nvim"

export DOTNET_CLI_TELEMETRY_OPTOUT=1
export GCM_CREDENTIAL_STORE="gpg"
export EDITOR="/snap/nvim/current/usr/bin/nvim"


# fnm
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi


