### Findutils-4.6.0

#### Configure
```
tar xvf findutils-4.6.0.tar.gz
cd findutils

sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' gl/lib/*.c
sed -i '/unistd/a #include <sys/sysmacros.h>' gl/lib/mountlist.c
echo "#define _IO_IN_BACKUP 0x100" >> gl/lib/stdio-impl.h

./configure          \
    --prefix=/tools  \
    --host=$LFS_TGT
```

#### Make Install
```
make
make DESTDIR=$LFS install
```
