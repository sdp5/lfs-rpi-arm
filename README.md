# lfs-rpi-armv6l
linux build log

- linux from scratch v7.6
- Raspberry Pi 2011.12
    - Model B Revision 2.0 (512MB)
- Arch armv6l

### Steps

#### Prepare

1. Create a new partition (*min 4GiB*) and mount `/mnt/lfs`
2. `export LFS=/mnt/lfs` and `mkdir -v $LFS/sources`
3. Download source packages in `$LFS/sources`
4. `mkdir -v $LFS/tools` and `ln -sv $LFS/tools /`
5. `groupadd lfs` and `useradd -s /bin/bash -g lfs -m -k /dev/null lfs`
6. Set `lfs` password and environments

#### Compile

Continue reading in `compile` dir.

### Disclaimer

Contents included here, belong to their respective owners.<br>
This is just an activity logger to be used as reference purposes only.
