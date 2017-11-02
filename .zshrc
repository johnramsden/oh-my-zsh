######################################################
## --------------- ZSH Configuration -------------- ##
######################################################

# Custom Variables
USER_ZSH_ROOT=${HOME}/.config/oh-my-zsh

## ---------------------- ZSH --------------------- ##

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/
# History
HISTFILE=${USER_ZSH_ROOT}/zsh_history
# Change custom directory
ZSH_CUSTOM=${USER_ZSH_ROOT}/custom
# Theme
ZSH_THEME="af-magic"
# Dont auto update
DISABLE_AUTO_UPDATE=true
# Start ssh-add on boot, add here or to ~/.pam_environment, pam is preferred
#export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"

# Load plugins
plugins=(git archlinux systemd history sudo zsh-autosuggestions zfs-snap-pacman vcsh history-sync)

# Set zfs datasets to snapshot in ${ZSH_CUSTOM}/plugins/zfs-snap-pacman/zfs-snap-pacman-datasets.zsh
# with ZFS_PAC_SNAP_DATASETS=(list of datasets...)

source ${ZSH}/oh-my-zsh.sh

## -------------------- System -------------------- ##

PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:${HOME}/.local/bin:/usr/bin/core_perl"
export MANPATH="/usr/local/man:${MANPATH}"

## ------------------- LANGUAGES ------------------- ##

# Dont install software system-wide
export GEM_HOME=$(ruby -e 'print Gem.user_dir')
PATH="$(ruby -e 'print Gem.user_dir')/bin:${PATH}"

export npm_config_prefix=${HOME}/.node_modules
PATH="${HOME}/.node_modules/bin:${PATH}"

## --------------------- MISC ---------------------- ##

# Prevent wine file associations
export WINEDLLOVERRIDES="winemenubuilder.exe=d"

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DOCUMENTS_DIR="${HOME}/University/Documents"
export GPG_TTY=$(tty)
# Preferred editor
export EDITOR='nano'
# Use KDE's kioclient for electron's trash.
export ELECTRON_TRASH=kioclient5

export PATH

## ------------------- PLUGINS --------------------- ##

# GPG Encrypted history sync settings
export ZSH_HISTORY_FILE=${HISTFILE}
export ZSH_HISTORY_PROJ=${USER_ZSH_ROOT}/zsh-encrypted-history
export ZSH_HISTORY_FILE_ENC=${ZSH_HISTORY_PROJ}/zsh_history
export GIT_COMMIT_MSG="History update from $(hostname) - $(date)"
