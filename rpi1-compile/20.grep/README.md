### Grep-3.3

#### Configure
```
tar xvf grep-3.3.tar.xz
cd grep-3.3

./configure         \
    --prefix=/tools \
    --host=$LFS_TGT
```

#### Make Install
```
make
make install
```
