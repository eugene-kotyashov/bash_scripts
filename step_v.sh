#!/bin/bash
git clone -b "release/4.0" https://github.com/FFmpeg/FFmpeg.git
cd FFmpeg
./configure --enable-shared --enable-libopenh264 --enable-libvpx
#GUI client: ./configure --enable-shared --enable-libopenh264 --enable-libvpx --extra-ldsoflags="-Wl,-rpath=./lib"
make -j 8
sudo make install
cd ../
rm -rf FFmpeg
