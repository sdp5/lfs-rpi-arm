### GCC-4.7.2 - Pass 1

#### Setup Env

```
cd $LFS/sources
bzip2 -d gcc-4.7.2.tar.bz2
tar -xvf gcc-4.7.2.tar
cd gcc-4.7.2

tar -Jxf ../mpfr-3.1.1.tar.xz
mv -v mpfr-3.1.1 mpfr
tar -Jxf ../gmp-5.1.1.tar.xz
mv -v gmp-5.1.1 gmp
tar -zxf ../mpc-1.0.1.tar.gz
mv -v mpc-1.0.1 mpc

# apply patch for gnueabihf target
patch -Np1 -i $LFS/sources/patches/gcc-4.7.2-gnueabihf-triplet-support.patch
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

# output
'gcc/config/i386/sysv4.h' -> 'gcc/config/i386/sysv4.h.orig'
'gcc/config/i386/linux64.h' -> 'gcc/config/i386/linux64.h.orig'
'gcc/config/i386/linux.h' -> 'gcc/config/i386/linux.h.orig'
'gcc/config/frv/linux.h' -> 'gcc/config/frv/linux.h.orig'
'gcc/config/vax/linux.h' -> 'gcc/config/vax/linux.h.orig'
'gcc/config/sh/linux.h' -> 'gcc/config/sh/linux.h.orig'
'gcc/config/arm/linux-eabi.h' -> 'gcc/config/arm/linux-eabi.h.orig'
'gcc/config/arm/linux-elf.h' -> 'gcc/config/arm/linux-elf.h.orig'
'gcc/config/cris/linux.h' -> 'gcc/config/cris/linux.h.orig'
'gcc/config/tilepro/linux.h' -> 'gcc/config/tilepro/linux.h.orig'
'gcc/config/m68k/linux.h' -> 'gcc/config/m68k/linux.h.orig'
'gcc/config/tilegx/linux.h' -> 'gcc/config/tilegx/linux.h.orig'
'gcc/config/m32r/linux.h' -> 'gcc/config/m32r/linux.h.orig'
'gcc/config/linux.h' -> 'gcc/config/linux.h.orig'
'gcc/config/sparc/sysv4.h' -> 'gcc/config/sparc/sysv4.h.orig'
'gcc/config/sparc/linux64.h' -> 'gcc/config/sparc/linux64.h.orig'
'gcc/config/sparc/linux.h' -> 'gcc/config/sparc/linux.h.orig'
'gcc/config/xtensa/linux.h' -> 'gcc/config/xtensa/linux.h.orig'
'gcc/config/s390/linux.h' -> 'gcc/config/s390/linux.h.orig'
'gcc/config/mn10300/linux.h' -> 'gcc/config/mn10300/linux.h.orig'
'gcc/config/rs6000/sysv4.h' -> 'gcc/config/rs6000/sysv4.h.orig'
'gcc/config/rs6000/linux64.h' -> 'gcc/config/rs6000/linux64.h.orig'
'gcc/config/rs6000/linux.h' -> 'gcc/config/rs6000/linux.h.orig'
'gcc/config/alpha/linux-elf.h' -> 'gcc/config/alpha/linux-elf.h.orig'
'gcc/config/alpha/linux.h' -> 'gcc/config/alpha/linux.h.orig'
'gcc/config/ia64/sysv4.h' -> 'gcc/config/ia64/sysv4.h.orig'
'gcc/config/ia64/linux.h' -> 'gcc/config/ia64/linux.h.orig'
'gcc/config/microblaze/linux.h' -> 'gcc/config/microblaze/linux.h.orig'
'gcc/config/bfin/linux.h' -> 'gcc/config/bfin/linux.h.orig'
'gcc/config/mips/linux64.h' -> 'gcc/config/mips/linux64.h.orig'
'gcc/config/mips/linux.h' -> 'gcc/config/mips/linux.h.orig'
```

```
sed -i '/k prot/agcc_cv_libc_provides_ssp=yes' gcc/configure

sed -i 's/BUILD_INFO=info/BUILD_INFO=/' gcc/configure

mkdir -v ../gcc-build
cd ../gcc-build
```


#### Configure

```
../gcc-4.7.2/configure                                  \
    --target=$LFS_TGT                                   \
    --prefix=/tools                                     \
    --with-sysroot=$LFS                                 \
    --with-newlib                                       \
    --without-headers                                   \
    --with-local-prefix=/tools                          \
    --with-native-system-header-dir=/tools/include      \
    --disable-nls                                       \
    --disable-shared                                    \
    --disable-multilib                                  \
    --disable-decimal-float                             \
    --disable-threads                                   \
    --disable-libmudflap                                \
    --disable-libssp                                    \   
    --disable-libgomp                                   \
    --disable-libquadmath                               \
    --enable-languages=c                                \
    --with-mpfr-include=$(pwd)/../gcc-4.7.2/mpfr/src    \
    --with-mpfr-lib=$(pwd)/mpfr/src/.libs

# configure info
*** This configuration is not supported in the following subdirectories:
     target-libquadmath gnattools target-libada target-libstdc++-v3 target-libgfortran target-libgo target-libffi target-zlib target-libjava target-libobjc target-libgomp target-libmudflap target-libssp target-boehm-gc target-libitm
    (Any other directories should still work fine.)

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
