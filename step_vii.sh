#!/bin/bash
git clone https://github.com/Tencent/rapidjson.git
cd rapidjson
mkdir build-release
cd build-release
cmake -DCMAKE_BUILD_TYPE=Release ../
make -j 8
sudo make install
cd ../../
rm -rf rapidjson
