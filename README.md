# lfs-rpi-arm
linux build log

- Linux from scratch v10.0-systemd with this [guide](https://intestinate.com/pilfs/guide.html).

Raspberry Pi | Model | CPU | Memory | build, host 
-------------|-------|-----|--------|----------
RPi 1 2011.12 | B Rev 2.0 | ARM1176JZF-S 700 MHz | 512 MiB | armv6l-unknown-linux-gnueabihf
RPi 3 | B+ | Cortex-A53 1.4 GHz | 1 GiB | armv7l-unknown-linux-gnueabihf


## Structure

### Part I - Introduction

### Part II - Preparing for the Build

#### Chapter 2 *Preparing the Host System*
    describes how to create a new Linux native partition and file system. This is the place where the new LFS system will be compiled and installed.

|   Run [version-check.sh](https://github.com/sundeep-anand/lfs-rpi-arm/tree/master/scripts/version-check.sh) to see whether your host system has all the appropriate versions.

1. Create a new partition (*min 10 GiB*) and mount `/mnt/lfs`
2. Export variables ..
    - `export LFS=/mnt/lfs`
    - `export LFS_TGT=$(uname -m)-lfs-linux-gnueabihf`


#### Chapter 3 *Packages and Patches*
    explains which packages and patches need to be downloaded to build an LFS system and how to store them on the new file system.

| Download source packages in `$LFS/sources` [wget-list](https://github.com/sundeep-anand/lfs-rpi-armv6l/tree/master/packages/wget-list).

#### Chapter 4 *Final Preparations*
    discusses the setup of an appropriate working environment.

```
mkdir -pv $LFS/{bin,etc,lib,sbin,usr,var}
mkdir -pv $LFS/tools
ln -s $LFS/tools /

groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs
passwd lfs

chown -v lfs $LFS/{usr,lib,var,etc,bin,sbin,tools}
chown -v lfs $LFS/sources
```

| Follow [LFS v10.0](http://www.linuxfromscratch.org/lfs/downloads/10.0-systemd/LFS-BOOK-10.0-systemd.pdf) to set environment.

```
cat > ~/.bash_profile << "EOF"
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
EOF

cat > ~/.bashrc << "EOF"
set +h
umask 022
LFS=/mnt/lfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnueabihf
PATH=/usr/bin
if [ ! -L /bin ]; then PATH=/bin:$PATH; fi
PATH=$LFS/tools/bin:$PATH
export LFS LC_ALL LFS_TGT PATH
EOF

source ~/.bash_profile
```

### Part III - Building the LFS Cross Toolchain and Temporary Tools

#### Chapter 5 Compiling a Cross-Toolchain
    explains the installation of the initial tool chain, (binutils, gcc, and glibc) using cross compilation techniques to isolate the new tools from the host system.

| Compile toolchain logs: 
[rpi1](https://github.com/sundeep-anand/lfs-rpi-arm/tree/master/rpi1-compile/), 
[rpi3](https://github.com/sundeep-anand/lfs-rpi-arm/tree/master/rpi3-compile/)

#### Chapter 6
    shows you how to cross-compile basic utilities using the just built cross-toolchain.

#### Chapter 7
    then enters a "chroot" environment and uses the previously built tools to build the additional tools needed to build and test the final system.

### Part IV - Building the LFS System

#### Chapter 8
    The full LFS system is built. Another advantage provided by the chroot environment is that it allows us to continue using the host system while LFS is being built.

#### Chapter 9
    the basic system configuration is set up to finish the installation.

#### Chapter 10
    the kernel and boot loader are set up.

#### Chapter 11
    contains information on continuing the LFS experience beyond. After these steps , the computer will be ready to reboot into the new LFS system.

### Part V - Appendices


## Disclaimer

Contents included here, belong to their respective owners.<br>
This is just an activity logger to be used as reference purposes only.
