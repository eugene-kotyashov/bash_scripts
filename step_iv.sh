#!/bin/bash
git clone https://chromium.googlesource.com/webm/libvpx
cd libvpx
./configure --extra-cflags="-fPIC" --extra-cxxflags="-fPIC" --enable-better-hw-compatibility --enable-vp8 --enable-vp9 --enable-vp9-postproc --enable-realtime-only --enable-runtime-cpu-detect
make -j 8
sudo make install
cd ../
rm -rf ./libvpx
