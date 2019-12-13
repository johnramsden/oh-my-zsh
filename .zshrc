#!/usr/bin/env zsh

######################################################
## --------------- ZSH Configuration -------------- ##
######################################################

## --------------- Custom Variables --------------- ##

USER_ZSH_ROOT=${HOME}/.config/oh-my-zsh

## ---------------------- ZSH --------------------- ##

# Path to your oh-my-zsh installation.
ZSH=${HOME}/.local/share/oh-my-zsh/

# History
HISTFILE=${USER_ZSH_ROOT}/zsh_history
HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=100000
SAVEHIST=100000
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.

# Change custom directory
ZSH_CUSTOM=${USER_ZSH_ROOT}/custom
# Theme
ZSH_THEME="af-magic"
# Dont auto update oh-my-zsh
DISABLE_AUTO_UPDATE=true

# Load plugins
plugins=(git ubuntu systemd history sudo zsh-autosuggestions you-should-use)

source ${ZSH}/oh-my-zsh.sh

## -------------------- SYSTEM -------------------- ##

PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:${HOME}/.local/bin:/usr/bin/core_perl"
export MANPATH="/usr/local/man:${MANPATH}"

## --------------------- MISC ---------------------- ##

export XDG_CONFIG_HOME="${HOME}/.config"
export GPG_TTY=$(tty)
export EDITOR='nano'

export PATH

## -------------------- PLUGINS --------------------- ##

export YSU_MODE=ALL

