# lfs-rpi-armv6l
linux build log

- Linux from scratch v7.3 with the [fix](https://sourceware.org/bugzilla/attachment.cgi?id=6807).
- Raspberry Pi 2011.12
    - Model B Revision 2.0 (512MB)
    - Linux raspberrypi 5.4.51+ #1333 armv6l GNU/Linux
- Build/host **armv6l-unknown-linux-gnueabihf**

## Steps

### Prepare

1. Create a new partition (*min 4GiB*) and mount `/mnt/lfs`
2. Export variables ..
    - `export LFS=/mnt/lfs`
    - `export LFS_TGT=armv6l-lfs-linux-gnueabihf`
3. Download source packages in `$LFS/sources`
4. `mkdir -v $LFS/tools` and `ln -sv $LFS/tools /tools`
    - `export PREFIX=/tools`
5. `groupadd lfs` and `useradd -s /bin/bash -g lfs -m -k /dev/null lfs`
6. Follow [LFS v7.3](http://www.linuxfromscratch.org/lfs/downloads/7.3/LFS-BOOK-7.3.pdf) to set environment.

### Moving further

Task | Directory
-----|-----------
Download packages, patches | [packages](https://github.com/sundeep-anand/lfs-rpi-armv6l/tree/lfs-7.3/packages)
Construct temp system | [compile](https://github.com/sundeep-anand/lfs-rpi-armv6l/tree/lfs-7.3/compile)


## Disclaimer

Contents included here, belong to their respective owners.<br>
This is just an activity logger to be used as reference purposes only.
