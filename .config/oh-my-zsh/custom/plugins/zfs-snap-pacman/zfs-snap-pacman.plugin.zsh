source ${0:A:h}/zfs-snap-pacman-datasets.zsh

datasets=${ZFS_PAC_SNAP_DATASETS}

iterate-snaps(){
  for dataset in ${datasets}; do
    echo "Taking snapshot: ${dataset}@${1}"
    sudo zfs snapshot "${dataset}@${1}"
  done
}

# ZFS Snapshot before command
# Update with pre and post snapshot
zupg(){
  snap_date="$(date +%Y-%m-%d-%H%M%S)"
  echo "Updating system..."

  iterate-snaps "pre-update-${snap_date}"

  echo "Starting update..."
  pacaur -Syu

  iterate-snaps "post-update-${snap_date}"
}

zin(){
  packages=""
  snap_date="$(date +%Y-%m-%d-%H%M%S)"
  for var in $@;
    do
      packages="${packages}-${var}";
  done
  echo "Pre-install..."

  iterate-snaps "pre-install${packages}-${snap_date}"

  echo
  echo "Installing packages: ${@}..."
  sudo pacman -S ${@}
  echo

  echo "Post-install..."

  iterate-snaps "post-install${packages}-${snap_date}"
}

zain(){
  packages=""
  snap_date="$(date +%Y-%m-%d-%H%M%S)"
  for var in $@;
    do
      packages="${packages}-${var}";
  done
  echo "Pre-install..."

  iterate-snaps "pre-install${packages}-${snap_date}"

  echo
  echo "Installing packages: ${@}..."
  pacaur -S ${@}
  echo

  echo "Post-install..."

  iterate-snaps "post-install${packages}-${snap_date}"
}
