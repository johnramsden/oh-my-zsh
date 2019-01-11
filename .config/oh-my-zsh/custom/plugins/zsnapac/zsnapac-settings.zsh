#!/bin/sh

# Add datasets to snapshot
ZFS_PAC_SNAP_DATASETS=( "$(mount | awk '/ \/ / {print $1}')"
                        "vault/sys/$(hostname)/var/cache"
                        "vault/sys/$(hostname)/var/cache/pacman"
                        "vault/sys/$(hostname)/var/cache/pacman/custom")

# Replace function with your aur update of choice
ZFS_AUR_UPDATE(){
    echo "Building packages with aursync: ${@:1}"

    aur sync --upgrades --chroot --temp --makepkg-conf="/etc/makepkg.conf" ${@:1}

    #pacaur -Syu ${@:1}
    #trizen -Syu ${@:1}

    return ${?}
}
