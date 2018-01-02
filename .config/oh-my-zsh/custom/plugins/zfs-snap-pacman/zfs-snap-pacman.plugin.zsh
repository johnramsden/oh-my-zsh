source ${0:A:h}/zfs-snap-pacman-datasets.zsh

datasets=${ZFS_PAC_SNAP_DATASETS}

iterate_snaps(){
  command="${1}"
  snap_name="${2}"

  for dataset in ${datasets}; do

    if [ ${command} = "create" ]; then
      echo "Taking snapshot: ${dataset}@${snap_name}"
      sudo zfs snapshot "${dataset}@${snap_name}"
      snap_success=${?}
    elif [ ${command} = "destroy" ]; then
      echo "Destroying snapshot: ${dataset}@${snap_name}"
      sudo zfs destroy "${dataset}@${snap_name}"
      snap_success=${?}
    else
      echo "No such command ""'""${command}""'"
      return 2
    fi

    if [ ${snap_success} -ne 0 ]; then
      echo "Failed to ${command} snapshot ${dataset}@${snap_name}"
      return 1
    fi
  done

  return 0
}

# ZFS Snapshot before command
# Update with pre and post snapshot
zupg(){
  snap_date="$(date +%Y-%m-%d-%H%M%S)"
  echo "Updating system..."

  iterate_snaps "create" "pre-update-${snap_date}"
  iterate_snaps_success=${?}
  if [ ${iterate_snaps_success} -ne 0 ]; then
    echo "Failed to iterate over datasets during pre-update"
    return 1
  fi

  echo "Starting update..."
  sudo pacman -Syu
  update_success=${?}
  if [ ${update_success} -ne 0 ]; then
    echo "Failed to run aur update with ""'""pacman -Syu""'"
    return 2
  fi

  iterate_snaps "create" "post-update-${snap_date}"
  iterate_snaps_success=${?}
  if [ ${iterate_snaps_success} -ne 0 ]; then
    echo "Failed to iterate over datasets during post-update"
    return 3
  fi

  return 0
}

zin(){
  packages=""
  snap_date="$(date +%Y-%m-%d-%H%M%S)"
  for var in $@; do
      packages="${packages}-${var}";
  done
  echo "Pre-install..."

  iterate_snaps "create" "pre-install${packages}-${snap_date}"
  iterate_snaps_success=${?}
  if [ ${iterate_snaps_success} -ne 0 ]; then
    echo "Failed to iterate over datasets during pre-install"
    return 1
  fi

  echo
  echo "Installing packages: ${@}..."
  sudo pacman -S ${@}
  install_success=${?}

  echo

  if [ ${install_success} -ne 0 ]; then
    echo "Failed to run install with ""'""pacman -S ${@}""'"
    return 2
  fi

  echo "Post-install..."

  iterate_snaps "create" "post-install${packages}-${snap_date}"
  iterate_snaps_success=${?}
  if [ ${iterate_snaps_success} -ne 0 ]; then
    echo "Failed to iterate over datasets during post-install"
    return 3
  fi

  return 0
}

zain(){
  packages=""
  snap_date="$(date +%Y-%m-%d-%H%M%S)"
  for var in $@;
    do
      packages="${packages}-${var}";
  done
  echo "Pre-install..."

  iterate_snaps "create" "pre-install${packages}-${snap_date}"
  iterate_snaps_success=${?}
  if [ ${iterate_snaps_success} -ne 0 ]; then
    echo "Failed to iterate over datasets during pre-install"
    return 1
  fi

  echo
  echo "Installing packages: ${@}..."
  pacaur -S ${@}
  install_success=${?}

  echo

  if [ ${install_success} -ne 0 ]; then
    echo "Failed to run install with ""'""pacaur -S ${@}""'"
    return 2
  fi

  echo "Post-install..."

  iterate_snaps "create" "post-install${packages}-${snap_date}"
  iterate_snaps_success=${?}
  if [ ${iterate_snaps_success} -ne 0 ]; then
    echo "Failed to iterate over datasets during post-install"
    return 3
  fi

  return 0
}
