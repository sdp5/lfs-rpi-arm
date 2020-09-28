### Glibc-2.30

#### Configure
```
tar xvf glibc-2.30.tar.xz
cd glibc-2.30
if [ ! -r /usr/include/rpc/types.h ]; then
  su -c 'mkdir -p /usr/include/rpc'
  su -c 'cp -v sunrpc/rpc/*.h /usr/include/rpc'
fi
mkdir -v ../glibc-build
cd ../glibc-build
../glibc-2.30/configure                             \
    --prefix=/tools                                 \
    --host=$LFS_TGT                                 \
    --build=$(../glibc-2.30/scripts/config.guess)   \
    --enable-kernel=3.2                             \
    --with-headers=/tools/include
```

#### Make, Install
```
make
make install
# Compatibility symlink for non ld-linux-armhf awareness
ln -sv ld-2.17.so $LFS/tools/lib/ld-linux.so.3
```

#### Sanity Check
```
echo 'int main(){}' > dummy.c
$LFS_TGT-gcc dummy.c
readelf -l a.out | grep ': /tools'
```
Output
```
[Requesting program interpreter: /tools/lib/ld-linux-armhf.so.3]
```
