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

function check_tarballs() {
LIST_OF_TARBALLS="
binutils-2.23.1.tar.bz2
gcc-4.7.2.tar.bz2
mpfr-3.1.1.tar.xz
gmp-5.1.1.tar.xz
mpc-1.0.1.tar.gz
glibc-2.17.tar.xz
tcl8.6.0-src.tar.gz
expect5.45.tar.gz
dejagnu-1.5.tar.gz
check-0.9.9.tar.gz
ncurses-5.9.tar.gz
bash-4.2.tar.gz
bzip2-1.0.6.tar.gz
coreutils-8.21.tar.xz
diffutils-3.2.tar.gz
file-5.13.tar.gz
findutils-4.4.2.tar.gz
gawk-4.0.2.tar.xz
gettext-0.18.2.tar.gz
grep-2.14.tar.xz
gzip-1.5.tar.xz
m4-1.4.16.tar.bz2
make-3.82.tar.bz2
patch-2.7.1.tar.xz
perl-5.16.2.tar.bz2
sed-4.2.2.tar.bz2
tar-1.26.tar.bz2
texinfo-5.0.tar.xz
xz-5.0.4.tar.xz
patches/gcc-4.7.2-gnueabihf-triplet-support.patch
patches/bash-4.2-fixes-11.patch
patches/perl-5.16.2-libc-1.patch
"

for tarball in $LIST_OF_TARBALLS ; do
    if ! [[ -f $LFS/sources/$tarball ]] ; then
        echo "Can't find $LFS/sources/$tarball!"
        exit 1
    fi
done
}

function check_kernel() {
    if ! [[ -f $LFS/sources/raspberrypi-linux-git.tar.gz ]] ; then
        echo "Can't find the Raspberry Pi kernel sources (raspberrypi-linux-git.tar.gz)."
        echo "Would you like to download it now?"
        select yn in "Yes" "No"; do
            case $yn in
                Yes ) wget https://github.com/raspberrypi/linux/archive/rpi-3.6.y.tar.gz -O $LFS/sources/raspberrypi-linux-git.tar.gz; break;;
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

function do_strip {
    set +o errexit
    if [[ $STRIP_AND_DELETE_DOCS = 1 ]] ; then
        strip --strip-debug /tools/lib/*
        strip --strip-unneeded /tools/{,s}bin/*
        rm -rf /tools/{,share}/{info,man,doc}
    fi
}

prebuild_sanity_check
check_kernel
check_firmware
check_tarballs
