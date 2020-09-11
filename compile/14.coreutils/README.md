### Coreutils-8.31

#### Configure
```
./configure                             \
    --prefix=/tools                     \
    --host=$LFS_TGT                     \
    --build=$(build-aux/config.guess)   \
    --enable-install-program=hostname   \
    --enable-no-install-program=kill,uptime
```

#### Make Install
```
make
make install
```
