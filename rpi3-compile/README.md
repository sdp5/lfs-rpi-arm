
## Chapter 5

### [5.2] ===

```
tar -Jvxf binutils-2.35.tar.xz
cd binutils-2.35
mkdir -v build
cd build

mkdir -v $LFS/build-logs/binutils-pass1

time { ../configure --prefix=$LFS/tools --with-sysroot=$LFS --target=$LFS_TGT --disable-nls --disable-werror | tee $LFS/build-logs/binutils-pass1/binutils-configure && make -j $PARALLEL_JOBS | tee $LFS/build-logs/binutils-pass1/binutils-make && make install | tee $LFS/build-logs/binutils-pass1/binutils-make_install && tree $LFS/tools | tee $LFS/build-logs/binutils-pass1/binutils-snapshot; }
```

```
real	6m23.434s
user	16m15.631s
sys	    1m59.838s
```

### [5.3] ===

```
tar -Jvxf gcc-10.2.0.tar.xz
cd gcc-10.2.0

patch -Np1 -i ../gcc-9.1.0-rpi3-cpu-default.patch

> patching file gcc/config.gcc
> Hunk #1 succeeded at 1279 (offset 90 lines).

tar -Jvxf ../mpfr-4.1.0.tar.xz
mv -v mpfr-4.1.0 mpfr
tar -Jvxf ../gmp-6.2.0.tar.xz
mv -v gmp-6.2.0 gmp
tar -zvxf ../mpc-1.2.0.tar.gz
mv -v mpc-1.2.0 mpc

mkdir -v build
cd build

mkdir -v $LFS/build-logs/gcc-pass1

time { ../configure --target=$LFS_TGT --prefix=$LFS/tools --with-glibc-version=2.11 --with-sysroot=$LFS --with-newlib --without-headers --enable-initfini-array --disable-nls --disable-shared --disable-multilib --disable-decimal-float --disable-threads --disable-libatomic --disable-libgomp --disable-libquadmath --disable-libssp --disable-libvtv --disable-libstdcxx --enable-languages=c,c++ | tee $LFS/build-logs/gcc-pass1/gcc-configure && make -j $PARALLEL_JOBS | tee $LFS/build-logs/gcc-pass1/gcc-make && make install | tee $LFS/build-logs/gcc-pass1/gcc-make_install && tree $LFS/tools | tee $LFS/build-logs/gcc-pass1/gcc-snapshot; }
```

```
*** This configuration is not supported in the following subdirectories:
     target-libquadmath target-libstdc++-v3 gnattools gotools target-libada target-libhsail-rt target-libphobos target-zlib target-libbacktrace target-libgfortran target-libgo target-libffi target-libobjc target-libgomp target-liboffloadmic target-libatomic target-libvtv target-libssp target-libitm target-libsanitizer
    (Any other directories should still work fine.)
```

```
real	192m6.626s
user	222m20.224s
sys	    19m28.854s
```

```
cd ..
cat gcc/limitx.h gcc/glimits.h gcc/limity.h > `dirname $($LFS_TGT-gcc -print-libgcc-file-name)`/install-tools/include/limits.h
```

### [5.4] ===

```
tar -zvxf rpi-5.4.y.tar.gz
cd linux-rpi-5.4.y

mkdir -v $LFS/build-logs/linux-rpi

time { make mrproper | tee $LFS/build-logs/linux-rpi/mrproper && make headers | tee $LFS/build-logs/linux-rpi/make_headers; }
```

```
real	1m34.576s
user	0m54.460s
sys	0m32.963s
```

```
find usr/include -name '.*' -delete
rm usr/include/Makefile
cp -rv usr/include $LFS/usr

rm -fr linux-rpi-5.4.y
```

### [5.5] ===

```
tar -Jvxf glibc-2.32.tar.xz
cd glibc-2.32
patch -Np1 -i ../glibc-2.32-fhs-1.patch

> patching file Makeconfig
> Hunk #1 succeeded at 245 (offset -5 lines).
> patching file nscd/nscd.h
> Hunk #1 succeeded at 161 (offset 49 lines).
> patching file nss/db-Makefile
> patching file sysdeps/generic/paths.h
> patching file sysdeps/unix/sysv/linux/paths.h
```

```
mkdir -v build
cd build

mkdir -v $LFS/build-logs/glibc

time { ../configure --prefix=/usr --host=$LFS_TGT --build=$(../scripts/config.guess) --enable-kernel=3.2 --with-headers=$LFS/usr/include libc_cv_slibdir=/lib | tee $LFS/build-logs/glibc/configure && make | tee $LFS/build-logs/glibc/make && make DESTDIR=$LFS install | tee $LFS/build-logs/glibc/make_install; }
```

```
real	78m31.754s
user	65m26.710s
sys 	9m36.997s
```

```
echo 'int main(){}' > dummy.c
$LFS_TGT-gcc dummy.c
readelf -l a.out | grep '/ld-linux'

[Requesting program interpreter: /lib/ld-linux-armhf.so.3]
```

```
# Compatibility symlink for non ld-linux-armhf awareness
ln -sv ld-2.32.so $LFS/tools/lib/ld-linux.so.3


# check for /tools/$LFS_TGT/include/c++/10.2.0
# if not created, copy from host
/usr/include/c++/%{version}
```

### [5.6] ===

```
tar -Jvxf gcc-10.2.0.tar.xz
cd gcc-10.2.0
mkdir -v build
cd build

mkdir -v $LFS/build-logs/libstdc

time { ../libstdc++-v3/configure --host=$LFS_TGT --build=$(../config.guess) --prefix=/usr --disable-multilib --disable-nls --disable-libstdcxx-pch --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/10.2.0 | tee $LFS/build-logs/libstdc/configure && make -j $PARALLEL_JOBS | tee $LFS/build-logs/libstdc/make && make DESTDIR=$LFS install | tee $LFS/build-logs/libstdc/make_install; }
```

```
real	4m7.149s
user	9m53.526s
sys	1m6.568s
```









