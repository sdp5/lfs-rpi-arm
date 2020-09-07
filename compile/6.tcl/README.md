### Tcl-8.6.9

#### Configure
```
tar xvf tcl8.6.9-src.tar.gz
cd tcl8.6.9/unix
./configure --prefix=/tools
```

#### Make, Install
```
make
make install
chmod -v u+w /tools/lib/libtcl8.6.so
make install-private-headers
ln -sv tclsh8.6 /tools/bin/tclsh
```
