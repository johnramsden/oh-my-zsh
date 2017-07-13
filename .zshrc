#########################################
## -------- ZSH Configuration -------- ##
#########################################

## --------------- ZSH --------------- ##

# Path to your oh-my-zsh installation.
ZSH=~/.oh-my-zsh/
# History file
HISTFILE=${HOME}/.config/oh-my-zsh/zsh_history
# Change custom directory
ZSH_CUSTOM=${HOME}/.config/oh-my-zsh/custom
# Theme
ZSH_THEME="af-magic"
# Dont auto update
DISABLE_AUTO_UPDATE=true
# Start ssh-add on boot
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
# Load plugins
plugins=(git archlinux systemd history sudo zsh-autosuggestions zfs-snap-pacman)

source $ZSH/oh-my-zsh.sh

## -------------- System ------------- ##


PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/john/.local/bin:/usr/bin/core_perl"
export PATH
export MANPATH="/usr/local/man:$MANPATH"

## -------- User Configuration -------- ##

export GPG_TTY=$(tty)
# Preferred editor
export EDITOR='nano'

## -------------- Software ------------- ##

## ----------- Other Options ----------- ##
