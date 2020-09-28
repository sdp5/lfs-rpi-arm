### Expect-5.45.4

#### Configure
```
tar xvf expect5.45.4
cd expect5.45.4

cp -v configure{,.orig}
sed 's:/usr/local/bin:/bin:' configure.orig > configure

./configure 
    --prefix=/tools         \
    --with-tcl=/tools/lib   \
    --with-tclinclude=/tools/include
```

#### Make, Install
```
make
make SCRIPTS="" install
```
