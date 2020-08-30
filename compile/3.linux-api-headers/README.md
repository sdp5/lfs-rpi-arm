### Linux RPI API Headers - 3.6.y

```
tar xvf raspberrypi-linux-git.tar.gz
cd linux-rpi-3.6.y
make mrproper
make headers_check
make INSTALL_HDR_PATH=dest headers_install
cp -rv dest/include/* /tools/include
```
