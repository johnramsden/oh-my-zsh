#!/usr/bin/zsh

## Custom aliases ##
####################

# root commands
alias suno='sudo nano'

alias s='sudo'

alias screenshot="import -window root ~/Pictures/$(date '+%Y%m%d-%H%M%S').png"
alias gitall="git remote | xargs -L1 git push --all"

# Misc
alias efstab='sudo nano /etc/fstab'

# tar
# Uncompressed tar archive: $ tar -cvf archive_name.tar dirname/
alias tarun='tar -cvf'
# Creating a tar gzipped compressed archive: $ tar -cvzf archive_name.tar.gz dirname/
alias gtar='tar -cvzf'
# Creating a bzipped tar compressed more than gzip archive: $ tar -cvfj archive_name.tar.bz2 dirname/
alias btar='tar -cvfj'
# Extract a *.tar file using option xvf: $ tar xvf archive_name.tar
alias xtar='tar -xvf'
# Extract a gzipped tar archive ( *.tar.gz ) using option xvzf: $ tar xvfz archive_name.tar.gz
alias gxtar='tar -xvfz'
# Extracting a bzipped tar archive ( *.tar.bz2 ) using option xvjf: $ tar xvfj archive_name.tar.bz2
alias bxtar='tar -xvfj'

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

alias paced="sudo nano /etc/pacman.conf"

function upall() {
  if [[ $(checkupdates) ]]; then
    if ! zsnapac update; then
      echo "Update failed"
      exit 1
    fi
  else
    echo "No system updates"
  fi

  if [[ $(aur repo --upgrades) ]]; then
    echo "Upgrading aur packages"
    zsnapac aur && sudo pacman -Syy && zsnapac update
  else
    echo "No AUR updates"
  fi
}
