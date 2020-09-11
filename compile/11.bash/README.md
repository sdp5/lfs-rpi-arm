### Bash-5.0

#### Configure
```
./configure                         \
    --prefix=/tools                 \
    --build=$(support/config.guess) \
    --host=$LFS_TGT                 \
    --without-bash-malloc
```

#### Make Install
```
make
make install
ln -sv bash /tools/bin/sh
```
