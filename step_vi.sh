#!/bin/bash
wget http://dlib.net/files/dlib-19.16.tar.bz2
tar xfj ./dlib-19.16.tar.bz2
cd dlib-19.16
mkdir build-release
cd build-release
cmake -DCMAKE_BUILD_TYPE=Release ../
make -j 8
sudo make install
cd ../../
rm -rf dlib-19.16*
