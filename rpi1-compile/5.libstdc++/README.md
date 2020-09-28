### Libstdc++ from GCC-9.2.0

#### Configure
```
tar xvf glibc-2.30.tar.xz
cd glibc-2.30
mkdir -v build
cd build
../libstdc++-v3/configure       \
    --host=$LFS_TGT             \
    --prefix=/tools             \
    --disable-multilib          \
    --disable-nls               \
    --disable-libstdcxx-threads \
    --disable-libstdcxx-pch     \
    --with-gxx-include-dir=/tools/lib/gcc/$LFS_TGT/9.2.0/include
```

#### Make, Install
```
make
make install
```
