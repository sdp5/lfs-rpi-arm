### Binutils-2.32 - Pass 1

#### Configure
```
cd $LFS/sources
tar xvf binutils-2.32.tar.bz2
cd binutils-2.32
mkdir -v ../binutils-build
cd ../binutils-build
../binutils-2.32/configure      \
    --prefix=/tools             \
    --with-sysroot=$LFS         \
    --with-lib-path=/tools/lib  \
    --target=$LFS_TGT           \
    --disable-nls               \
    --disable-werror
```

#### Make, Install

```
make
make install
```
