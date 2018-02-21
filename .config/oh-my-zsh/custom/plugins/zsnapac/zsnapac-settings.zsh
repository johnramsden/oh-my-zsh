# Add datasets to snapshot
ZFS_PAC_SNAP_DATASETS=("vault/sys/$(hostname)/ROOT/default")

# Replace function with your aur update of choice
ZFS_AUR_UPDATE(){
    echo "Building packages with aursync: ${@:1}"

    aursync --chroot --temp --update ${@:1}
    #pacaur -Syu ${@:1}
    #trizen -Syu ${@:1}

    return ${?}
}