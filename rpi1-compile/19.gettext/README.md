### Gettext-0.20.1

#### Configure
```
tar xvf gettext-0.20.1.tar.xz
cd gettext-0.20.1

./configure             \
    --disable-shared    \
    --prefix=/tools     \
    --host=$LFS_TGT     
```

#### Make Install
```
make
make DESTDIR=$LFS install
```
---
See [gettext-commands](https://github.com/sundeep-anand/lfs-rpi-armv6l/tree/master/compile/19.gettext/gettext-cmds-help.md) and logs.
