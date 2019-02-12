#!/bin/bash
wget https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz
tar xfz libevent-2.1.8-stable.tar.gz
cd libevent-2.1.8-stable
./configure
make -j 8
sudo make install
cd ../
rm -rf ./libevent-2.1.8-stable*
