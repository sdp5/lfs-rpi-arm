
## Chapter 6

### [6.2] ===

```
tar -Jvxf m4-1.4.18.tar.xz
cd m4-1.4.18
sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' lib/*.c
echo "#define _IO_IN_BACKUP 0x100" >> lib/stdio-impl.h

mkdir -v $LFS/build-logs/m4
```
```
time { ./configure --prefix=/usr --host=$LFS_TGT --build=$(build-aux/config.guess) | tee $LFS/build-logs/m4/configure && make -j $PARALLEL_JOBS | tee $LFS/build-logs/m4/make && make DESTDIR=$LFS install | tee $LFS/build-logs/m4/make_install; }

real	1m51.153s
user	2m40.178s
sys	0m28.172s
```
```
cd $LFS/sources
rm -rf m4-1.4.18
```

### [6.3] ===
```
tar -zvxf ncurses-6.2.tar.gz
cd ncurses-6.2
sed -i s/mawk// configure
mkdir build
pushd build
../configure
make -j $PARALLEL_JOBS -C include
make -j $PARALLEL_JOBS -C progs tic
popd

mkdir -v $LFS/build-logs/ncurses
```
```
time { ./configure --prefix=/usr --host=$LFS_TGT --build=$(./config.guess) --mandir=/usr/share/man --with-manpage-format=normal --with-shared --without-debug --without-ada --without-normal --enable-widec | tee $LFS/build-logs/ncurses/configure && make -j $PARALLEL_JOBS | tee $LFS/build-logs/ncurses/make && make DESTDIR=$LFS TIC_PATH=$(pwd)/build/progs/tic install | tee $LFS/build-logs/ncurses/make_install; }

real	3m43.295s
user	9m33.320s
sys	1m10.451s
```
```
echo "INPUT(-lncursesw)" > $LFS/usr/lib/libncurses.so
mv -v $LFS/usr/lib/libncursesw.so.6* $LFS/lib
ln -sfv ../../lib/$(readlink $LFS/usr/lib/libncursesw.so) $LFS/usr/lib/libncursesw.so
```
```
cd $LFS/sources
rm -rf ncurses-6.2
```

### [6.4] ===
```
tar -zvxf bash-5.0.tar.gz
cd bash-5.0

mkdir -v $LFS/build-logs/bash
```
```
time { ./configure --prefix=/usr --build=$(support/config.guess) --host=$LFS_TGT --without-bash-malloc | tee $LFS/build-logs/bash/configure && make -j $PARALLEL_JOBS | tee $LFS/build-logs/bash/make && make DESTDIR=$LFS install | tee $LFS/build-logs/bash/make_install; }

real	3m46.584s
user	8m58.763s
sys	0m50.291s
```
```
mv $LFS/usr/bin/bash $LFS/bin/bash
ln -sv bash $LFS/bin/sh
```
```
cd $LFS/sources
rm -rf bash-5.0
```

### [6.5] ===
```
tar -Jvxf coreutils-8.32.tar.xz
cd coreutils-8.32

mkdir -v $LFS/build-logs/coreutils
```
```
time { ./configure --prefix=/usr --host=$LFS_TGT --build=$(build-aux/config.guess) --enable-install-program=hostname --enable-no-install-program=kill,uptime | tee $LFS/build-logs/coreutils/configure && make -j $PARALLEL_JOBS | tee $LFS/build-logs/coreutils/make && make DESTDIR=$LFS install | tee $LFS/build-logs/coreutils/make_install; }

real	6m27.243s
user	15m2.422s
sys	1m58.967s
```
```
mv -v $LFS/usr/bin/{cat,chgrp,chmod,chown,cp,date,dd,df,echo} $LFS/bin
mv -v $LFS/usr/bin/{false,ln,ls,mkdir,mknod,mv,pwd,rm}        $LFS/bin
mv -v $LFS/usr/bin/{rmdir,stty,sync,true,uname}               $LFS/bin
mv -v $LFS/usr/bin/{head,nice,sleep,touch}                    $LFS/bin
mv -v $LFS/usr/bin/chroot                                     $LFS/usr/sbin
mkdir -pv $LFS/usr/share/man/man8
mv -v $LFS/usr/share/man/man1/chroot.1                        $LFS/usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/'                                           $LFS/usr/share/man/man8/chroot.8
```
```
cd $LFS/sources
rm -rf coreutils-8.32
```

### [6.6] ===
```
tar -Jvxf diffutils-3.7.tar.xz
cd diffutils-3.7

mkdir -v $LFS/build-logs/diffutils
```
```
time { ./configure --prefix=/usr --host=$LFS_TGT | tee $LFS/build-logs/diffutils/configure && make -j $PARALLEL_JOBS | tee $LFS/build-logs/diffutils/make && make DESTDIR=$LFS install | tee $LFS/build-logs/diffutils/make_install; }

real	1m54.502s
user	3m0.600s
sys	0m31.154s
```
```
cd $LFS/sources
rm -rf diffutils-3.7
```

### [6.7] ===
```
tar -zvxf file-5.39.tar.gz
cd file-5.39

mkdir -v $LFS/build-logs/file
```
```
time { ./configure --prefix=/usr --host=$LFS_TGT | tee $LFS/build-logs/file/configure && make -j $PARALLEL_JOBS | tee $LFS/build-logs/file/make && make DESTDIR=$LFS install | tee $LFS/build-logs/file/make_install; }

real	0m59.497s
user	1m52.614s
sys	0m17.625s
```
```
cd $LFS/sources
rm -rf file-5.39
```

### [6.8] === 
```
tar -Jvxf findutils-4.7.0.tar.xz
cd findutils-4.7.0

mkdir -v $LFS/build-logs/findutils
```
```
time { ./configure --prefix=/usr --host=$LFS_TGT --build=$(build-aux/config.guess) | tee $LFS/build-logs/findutils/configure && make -j $PARALLEL_JOBS | tee $LFS/build-logs/findutils/make && make DESTDIR=$LFS install | tee $LFS/build-logs/findutils/make_install; }

real	2m53.548s
user	4m20.566s
sys	0m46.805s
```
```
mv -v $LFS/usr/bin/find $LFS/bin
sed -i 's|find:=${BINDIR}|find:=/bin|' $LFS/usr/bin/updatedb
```
```
cd $LFS/sources
rm -rf findutils-4.7.0
```

### [6.9] ===
```
tar -Jvxf gawk-5.1.0.tar.xz
cd gawk-5.1.0
sed -i 's/extras//' Makefile.in

mkdir -v $LFS/build-logs/gawk
```
```
time { ./configure --prefix=/usr --host=$LFS_TGT --build=$(./config.guess) | tee $LFS/build-logs/gawk/configure && make -j $PARALLEL_JOBS | tee $LFS/build-logs/gawk/make && make DESTDIR=$LFS install | tee $LFS/build-logs/gawk/make_install; }

real	2m29.677s
user	5m31.614s
sys	0m27.945s
```
```
cd $LFS/sources
rm -rf gawk-5.1.0
```

### [6.10] ===
```
tar -Jvxf grep-3.4.tar.xz
cd grep-3.4

mkdir -v $LFS/build-logs/grep
```
```
time { ./configure --prefix=/usr --host=$LFS_TGT --bindir=/bin | tee $LFS/build-logs/grep/configure && make -j $PARALLEL_JOBS | tee $LFS/build-logs/grep/make && make DESTDIR=$LFS install | tee $LFS/build-logs/grep/make_install; }

real	2m0.148s
user	2m59.223s
sys	0m30.279s
```
```
cd $LFS/sources
rm -rf grep-3.4
```

### [6.11] ===
```
tar -Jvxf gzip-1.10.tar.xz
cd gzip-1.10

mkdir -v $LFS/build-logs/gzip
```
```
time { ./configure --prefix=/usr --host=$LFS_TGT | tee $LFS/build-logs/gzip/configure && make -j $PARALLEL_JOBS | tee $LFS/build-logs/gzip/make && make DESTDIR=$LFS install | tee $LFS/build-logs/gzip/make_install; }

real	1m4.974s
user	1m33.355s
sys	0m19.230s
```
```
mv -v $LFS/usr/bin/gzip $LFS/bin
cd $LFS/sources
rm -rf gzip-1.10
```

### [6.12] ===
```
tar -zvxf make-4.3.tar.gz
cd make-4.3

mkdir -v $LFS/build-logs/make
```
```
time { ./configure --prefix=/usr --without-guile --host=$LFS_TGT --build=$(build-aux/config.guess) | tee LFS/build-logs/make/configure && make -j $PARALLEL_JOBS | tee LFS/build-logs/make/make && make DESTDIR=$LFS install | tee LFS/build-logs/make/make_install; }

real	0m36.765s
user	0m27.583s
sys	0m9.164s
```
```
cd $LFS/sources
rm -rf make-4.3
```

### [6.13] ===
```
tar -Jvxf patch-2.7.6.tar.xz
cd patch-2.7.6

mkdir -v $LFS/build-logs/patch
```
```
time { ./configure --prefix=/usr --host=$LFS_TGT --build=$(build-aux/config.guess) | tee $LFS/build-logs/patch/configure && make -j $PARALLEL_JOBS | tee $LFS/build-logs/patch/make && make DESTDIR=$LFS install | tee $LFS/build-logs/patch/make_install; }

real	1m54.119s
user	2m48.429s
sys	0m29.480s
```
```
cd $LFS/sources
rm -rf patch-2.7.6
```

### [6.14] ===
```
tar -Jvxf sed-4.8.tar.xz
cd sed-4.8

mkdir -v $LFS/build-logs/sed
```
```
time { ./configure --prefix=/usr --host=$LFS_TGT --bindir=/bin | tee $LFS/build-logs/sed/configure && make -j $PARALLEL_JOBS | tee $LFS/build-logs/sed/make && make DESTDIR=$LFS install | tee $LFS/build-logs/sed/make_install; }

real	1m46.896s
user	2m19.388s
sys	0m26.341s
```
```
cd $LFS/sources
rm -rf sed-4.8
```

### [6.15] ===
```
tar -Jvxf tar-1.32.tar.xz
cd tar-1.32

mkdir -v $LFS/build-logs/tar
```
```
time { ./configure --prefix=/usr --host=$LFS_TGT --build=$(build-aux/config.guess) --bindir=/bin | tee $LFS/build-logs/tar/configure && make -j $PARALLEL_JOBS | tee $LFS/build-logs/tar/make && make DESTDIR=$LFS install | tee $LFS/build-logs/tar/make_install; }

real	2m54.095s
user	5m17.640s
sys	0m43.052s
```
```
cd $LFS/sources
rm -rf tar-1.32
```

### [6.16] ===
```
tar -Jvxf xz-5.2.5.tar.xz
cd xz-5.2.5

mkdir -v $LFS/build-logs/xz
```
```
time { ./configure --prefix=/usr --host=$LFS_TGT --build=$(build-aux/config.guess) --disable-static --docdir=/usr/share/doc/xz-5.2.5 | tee $LFS/build-logs/xz/configure && make -j $PARALLEL_JOBS | tee $LFS/build-logs/xz/make && make DESTDIR=$LFS install | tee $LFS/build-logs/xz/make_install; }

real	1m29.041s
user	3m6.625s
sys	0m32.573s
```
```
mv -v $LFS/usr/bin/{lzma,unlzma,lzcat,xz,unxz,xzcat}  $LFS/bin
mv -v $LFS/usr/lib/liblzma.so.*                       $LFS/lib
ln -svf ../../lib/$(readlink $LFS/usr/lib/liblzma.so) $LFS/usr/lib/liblzma.so
```
```
cd $LFS/sources
rm -rf xz-5.2.5
```

### [6.17] === _binutils pass-2_
```
tar -Jvxf binutils-2.35.tar.xz
cd binutils-2.35

mkdir -v $LFS/build-logs/binutils-pass-2

mkdir -v build
cd build
```
```
time { ../configure --prefix=/usr --build=$(../config.guess) --host=$LFS_TGT --disable-nls --enable-shared --disable-werror --enable-64-bit-bfd | tee $LFS/build-logs/binutils-pass-2/configure && make -j $PARALLEL_JOBS | tee $LFS/build-logs/binutils-pass-2/make && make DESTDIR=$LFS install | tee $LFS/build-logs/binutils-pass-2/make_install; }

real	8m17.677s
user	22m33.664s
sys	2m40.265s
```
```
cd $LFS/sources
rm -rf binutils-2.35
```

### [6.18] === gcc pass-2
```
tar -Jvxf gcc-10.2.0.tar.xz
cd gcc-10.2.0
patch -Np1 -i ../gcc-9.1.0-rpi3-cpu-default.patch

patching file gcc/config.gcc
Hunk #1 succeeded at 1279 (offset 90 lines).

tar -Jvxf ../mpfr-4.1.0.tar.xz
mv -v mpfr-4.1.0 mpfr
tar -Jvxf ../gmp-6.2.0.tar.xz
mv -v gmp-6.2.0 gmp
tar -zvxf ../mpc-1.2.0.tar.gz
mv -v mpc-1.2.0 mpc

mkdir -v $LFS/build-logs/gcc-pass-2

mkdir -v build
cd build
mkdir -pv $LFS_TGT/libgcc
ln -s ../../../libgcc/gthr-posix.h $LFS_TGT/libgcc/gthr-default.h
```
```
time { ../configure --build=$(../config.guess) --host=$LFS_TGT --prefix=/usr CC_FOR_TARGET=$LFS_TGT-gcc --with-build-sysroot=$LFS --enable-initfini-array --disable-nls --disable-multilib --disable-decimal-float --disable-libatomic --disable-libgomp --disable-libquadmath --disable-libssp --disable-libvtv --disable-libstdcxx --enable-languages=c,c++ | tee $LFS/build-logs/gcc-pass-2/configure && make -j $PARALLEL_JOBS | tee $LFS/build-logs/gcc-pass-2/make && make DESTDIR=$LFS install | tee $LFS/build-logs/gcc-pass-2/make_install; }

real	156m31.292s
user	241m7.213s
sys	19m13.427s
```
```
ln -sv gcc $LFS/usr/bin/cc

cd $LFS/sources
rm -rf gcc-10.2.0
```
