### Ncurses-6.1

#### Configure
```
tar xvf ncurses-6.1.tar.gz
cd ncurses-6.1

sed -i s/mawk// configure

./configure             \
    --prefix=/tools     \
    --target=$LFS_TGT   \
    --with-shared       \
    --without-debug     \
    --without-ada       \
    --enable-widec      \
    --enable-overwrite
```

#### Make Install
```
make
make install
ln -s libncursesw.so /tools/lib/libncurses.so
```
