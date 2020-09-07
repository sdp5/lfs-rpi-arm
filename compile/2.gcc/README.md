## GCC-9.2.0 

### Pass 1

#### Setup Env

```
cd $LFS/sources
tar xvf gcc-9.2.0.tar.xz
cd gcc-9.2.0

tar -xf ../mpfr-4.0.2.tar.xz
mv -v mpfr-4.0.2 mpfr
tar -xf ../gmp-6.1.2.tar.xz
mv -v gmp-6.1.2 gmp
tar -xf ../mpc-1.1.0.tar.gz
mv -v mpc-1.1.0 mpc

# apply patch for gnueabihf target
patch -Np1 -i $LFS/sources/gcc-9.1.0-rpi1-cpu-default.patch
```

```
# command for setting the location of GCC's default dynamic linker
for file in \
 $(find gcc/config -name linux64.h -o -name linux.h -o -name sysv4.h -o -name linux-eabi.h -o -name linux-elf.h)
do
  cp -uv $file{,.orig}
  sed -e 's@/lib\(64\)\?\(32\)\?/ld@/tools&@g' \
      -e 's@/usr@/tools@g' $file.orig > $file
  echo '
#undef STANDARD_STARTFILE_PREFIX_1
#undef STANDARD_STARTFILE_PREFIX_2
#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"
#define STANDARD_STARTFILE_PREFIX_2 ""' >> $file
  touch $file.orig
done
```

```
sed -i '/k prot/agcc_cv_libc_provides_ssp=yes' gcc/configure

sed -i 's/BUILD_INFO=info/BUILD_INFO=/' gcc/configure

mkdir -v ../gcc-build
cd ../gcc-build
```


#### Configure

```
../gcc-9.2.0/configure                            \
  --target=$LFS_TGT                               \
  --prefix=/tools                                 \
  --with-glibc-version=2.24                       \
  --with-sysroot=$LFS                             \
  --with-newlib                                   \
  --without-headers                               \
  --with-local-prefix=/tools                      \
  --with-native-system-header-dir=/tools/include  \
  --disable-nls                                   \
  --disable-shared                                \
  --disable-multilib                              \
  --disable-decimal-float                         \
  --disable-threads                               \
  --disable-libatomic                             \
  --disable-libgomp                               \
  --disable-libquadmath                           \
  --disable-libssp                                \
  --disable-libvtv                                \
  --disable-libstdcxx                             \
  --enable-languages=c,c++
```

#### Make, Install

```
# Workaround for a problem introduced with GMP 5.1.0.
# If configured by gcc with the "none" host & target, it will result in undefined references to '__gmpn_invert_limb' during linking.
sed -i 's/none-/armv6l-/' Makefile

make
make install

ln -vs libgcc.a `$LFS_TGT-gcc -print-libgcc-file-name | sed 's/libgcc/&_eh/'`
```

### Pass 2

#### Setup Env

```
cd $LFS/sources
tar xvf gcc-9.2.0.tar.xz
cd gcc-9.2.0

tar -xf ../mpfr-4.0.2.tar.xz
mv -v mpfr-4.0.2 mpfr
tar -xf ../gmp-6.1.2.tar.xz
mv -v gmp-6.1.2 gmp
tar -xf ../mpc-1.1.0.tar.gz
mv -v mpc-1.1.0 mpc

# apply patch for gnueabihf target
patch -Np1 -i $LFS/sources/gcc-9.1.0-rpi1-cpu-default.patch
```

```
# command for setting the location of GCC's default dynamic linker
for file in \
 $(find gcc/config -name linux64.h -o -name linux.h -o -name sysv4.h -o -name linux-eabi.h -o -name linux-elf.h)
do
  cp -uv $file{,.orig}
  sed -e 's@/lib\(64\)\?\(32\)\?/ld@/tools&@g' \
      -e 's@/usr@/tools@g' $file.orig > $file
  echo '
#undef STANDARD_STARTFILE_PREFIX_1
#undef STANDARD_STARTFILE_PREFIX_2
#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"
#define STANDARD_STARTFILE_PREFIX_2 ""' >> $file
  touch $file.orig
done
```

```
sed -i '/k prot/agcc_cv_libc_provides_ssp=yes' gcc/configure

sed -i 's/BUILD_INFO=info/BUILD_INFO=/' gcc/configure

mkdir -v ../gcc-build
cd ../gcc-build
```


#### Configure
```
../gcc-9.2.0/configure                            \
  --prefix=/tools                                 \
  --with-local-prefix=/tools                      \
  --with-native-system-header-dir=/tools/include  \
  --enable-languages=c,c++                        \
  --disable-libstdcxx-pch                         \
  --disable-multilib                              \
  --disable-bootstrap                             \
  --disable-libgomp
```

#### Make, Install

```
# Workaround for a problem introduced with GMP 5.1.0.
# If configured by gcc with the "none" host & target, it will result in undefined references to '__gmpn_invert_limb' during linking.
sed -i 's/none-/armv6l-/' Makefile

make
make install

ln -sv gcc /tools/bin/cc
```

#### Sanity Check
```
echo 'int main(){}' > dummy.c
cc dummy.c
readelf -l a.out | grep ': /tools'
```

Output
```
[Requesting program interpreter: /tools/lib/ld-linux-armhf.so.3]
```
