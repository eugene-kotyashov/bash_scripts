#!/bin/bash
git clone https://github.com/prilyx-guru-shiva/prxsocket.git
cd prxsocket
mkdir build-release
cd build-release
# GPU based building:
# cmake -DCMAKE_BUILD_TYPE=Release ../
# CPU based building:
cmake -DCMAKE_BUILD_TYPE=Release -DWITHOUT_CUDA=ON ../
make -j 8
cd ../bin
