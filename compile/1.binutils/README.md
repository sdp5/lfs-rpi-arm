## Binutils-2.32

### Pass 1

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

### Pass 2

#### Configure
```
cd $LFS/sources
tar xvf binutils-2.32.tar.bz2
cd binutils-2.32
mkdir -v ../binutils-build
cd ../binutils-build
CC=$LFS_TGT-gcc
AR=$LFS_TGT-ar
RANLIB=$LFS_TGT-ranlib
../binutils-2.32/configure      \
    --prefix=/tools             \
    --disable-nls               \
    --disable-werror            \
    --with-lib-path=/tools/lib  \
    --with-sysroot
```

#### Make, Install
```
make
make install
make -C ld clean
make -C ld LIB_PATH=/usr/lib:/lib
cp -v ld/ld-new /tools/bin
```
