### Diffutils-3.7

#### Configure
```
tar xvf diffutils-3.7.tar.x
cd diffutils-3.7

./configure          \
    --prefix=/tools \
    --host=$LFS_TGT
```

#### Make Install
```
make
make DESTDIR=$LFS install
```
