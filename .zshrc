######################################################
## --------------- ZSH Configuration -------------- ##
######################################################

## ---------------------- ZSH --------------------- ##

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/
# History file
HISTFILE=${HOME}/.config/oh-my-zsh/zsh_history
# Change custom directory
ZSH_CUSTOM=${HOME}/.config/oh-my-zsh/custom
# Theme
ZSH_THEME="af-magic"
# Dont auto update
DISABLE_AUTO_UPDATE=true
# Start ssh-add on boot
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
# Load plugins
plugins=(git archlinux systemd history sudo zsh-autosuggestions zfs-snap-pacman)

source ${ZSH}/oh-my-zsh.sh

## -------------------- System -------------------- ##

export XDG_CONFIG_HOME=${HOME}/.config
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/john/.local/bin:/usr/bin/core_perl"
export PATH
export MANPATH="/usr/local/man:$MANPATH"

## ------------------- Languages ------------------- ##

# Dont install software system-wide
#export GEM_HOME=$(ruby -e 'print Gem.user_dir')
#PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

#export npm_config_prefix=~/.node_modules
#PATH="$HOME/.node_modules/bin:$PATH"

## --------------------- MISC ---------------------- ##

export GPG_TTY=$(tty)
# Preferred editor
export EDITOR='nano'
