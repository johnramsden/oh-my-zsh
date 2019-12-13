#!/usr/bin/zsh

## Custom aliases ##
####################

# root commands
alias suno='sudo nano'

alias s='sudo'

alias gitall="git remote | xargs -L1 git push --all"

# Misc
alias efstab='sudo nano /etc/fstab'

# Takes ip/24 as argument
alias sshscan="sudo nmap -p 22 --open -sV"

## systemd ##

alias timersd='systemctl list-timers | less'
alias startvncserv="systemctl --user start vncserver@:1"
alias unitlist="systemctl list-units --type service --state active"
alias scu-enable-now="scu-enable --now"

systemd_commands=(
  start stop reload restart try-restart isolate kill
  reset-failed enable disable reenable preset mask unmask
  link load cancel set-environment unset-environment edit)
for c in $systemd_commands; do alias scu-$c="systemctl --user $c"; done

## packages ##

alias upall="sudo apt update && sudo apt upgrade && sudo apt autoremove"

## Common taks ##

# Find largest files:
# alias paced="

function delsshhost() {
    sed -i.bak -e "${1}d" "${HOME}/.ssh/known_hosts"
}
