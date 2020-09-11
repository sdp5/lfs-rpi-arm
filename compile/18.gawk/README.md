### Gawk-5.0.1

#### Configure
```
tar xvf gawk-5.0.1.tar.xz
cd gawk-5.0.1

./configure             \
    --prefix=/tools     \
    --host=$LFS_TGT     \
    --build=$(./config.guess)  
```

#### Make Install
```
make
make DESTDIR=$LFS install
```
