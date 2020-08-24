### Binutils-2.23.1 - Pass 1

#### Configure
```
./configure                         \
    --prefix=/tools                 \
    --with-sysroot=$LFS             \
    --with-lib-path=/tools/lib      \
    --target=$LFS_TGT               \
    --disable-nls                   \
    --disable-werror
```

#### Make, Install

```
make
make install
```
