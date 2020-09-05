#!/bin/bash
# Get gcc-4.7.2-gnueabihf-triplet-support.patch from ..
# https://gcc.gnu.org/legacy-ml/gcc-patches/2012-06/msg00444.html
# and refer https://intestinate.com/pilfs/patches/gcc-9.1.0-rpi1-cpu-default.patch

function prebuild_sanity_check() {
    if [[ $(whoami) != "lfs" ]] ; then
        echo "Not running as user lfs, you should be!"
        exit 1
    fi

    if ! [[ -v LFS ]] ; then
        echo "You forgot to set your LFS environment variable!"
        exit 1
    fi

    if ! [[ -v LFS_TGT ]] || [[ $LFS_TGT != "armv6l-lfs-linux-gnueabihf" ]] ; then
        echo "Your LFS_TGT variable should be set to armv6l-lfs-linux-gnueabihf"
        exit 1
    fi

    if ! [[ -d $LFS ]] ; then
        echo "Your LFS directory doesn't exist!"
        exit 1
    fi

    if ! [[ -d $LFS/sources ]] ; then
        echo "Can't find your sources directory!"
        exit 1
    fi

    if [[ $(stat -c %U $LFS/sources) != "lfs" ]] ; then
        echo "The sources directory should be owned by user lfs!"
        exit 1
    fi

    if ! [[ -d $LFS/tools ]] ; then
        echo "Can't find your tools directory!"
        exit 1
    fi

    if [[ $(stat -c %U $LFS/tools) != "lfs" ]] ; then
        echo "The tools directory should be owned by user lfs!"
        exit 1
    fi
}

function check_kernel() {
    if ! [[ -f $LFS/sources/raspberrypi-linux-git.tar.gz ]] ; then
        echo "Can't find the Raspberry Pi kernel sources (raspberrypi-linux-git.tar.gz)."
        echo "Would you like to download it now?"
        select yn in "Yes" "No"; do
            case $yn in
                Yes ) wget https://github.com/raspberrypi/linux/archive/rpi-5.0.y.tar.gz -O $LFS/sources/raspberrypi-linux-git.tar.gz; break;;
                No ) exit;;
            esac
        done
    fi
}

function check_firmware() {
    if ! [[ -f $LFS/sources/raspberrypi-firmware-git.tar.gz ]] ; then
        echo "Can't find the Raspberry Pi firmware binaries (raspberrypi-firmware-git.tar.gz)."
        echo "These will come in handy at the end of chapter 6."
        echo "Would you like to download it now?"
        select yn in "Yes" "No"; do
            case $yn in
                Yes ) wget https://github.com/raspberrypi/firmware/archive/master.tar.gz -O $LFS/sources/raspberrypi-firmware-git.tar.gz; break;;
                No ) exit;;
            esac
        done
    fi
}

prebuild_sanity_check
check_kernel
check_firmware
