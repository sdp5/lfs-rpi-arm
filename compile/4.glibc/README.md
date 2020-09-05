### Glibc-2.17

#### Prepare Env

```
tar xvf glibc-2.17.tar.xz
cd glibc-2.17

# to see if rpc headers are installed in 
# the host system and install if they are not
if [ ! -r /usr/include/rpc/types.h ]; then
  su -c 'mkdir -p /usr/include/rpc'
  su -c 'cp -v sunrpc/rpc/*.h /usr/include/rpc'
fi

mkdir -v ../glibc-build
cd ../glibc-build
```

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
