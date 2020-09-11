### File-5.37

#### Configure
```
tar xvf file-5.37.tar.gz
cd file-5.37

./configure         \
    --prefix=/tools \
    --host=$LFS_TGT
```

#### Make Install
```
make
make DESTDIR=$LFS install
```
