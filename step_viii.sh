#!/bin/bash

git clone -b "v3.6.0" https://github.com/google/protobuf.git
cd ./protobuf
./autogen.sh
./configure
make -j 8
sudo make install
cd ../
rm -rf ./protobuf

wget http://bitbucket.org/eigen/eigen/get/3.3.5.tar.bz2
tar xfj ./3.3.5.tar.bz2
cd ./eigen-eigen-b3f3d4950030
mkdir build-release
cd build-release
cmake -DCMAKE_BUILD_TYPE=Release ../
sudo make install
cd ../../
rm -rf ./eigen-eigen-b3f3d4950030

curl -LO "https://github.com/bazelbuild/bazel/releases/download/0.18.1/bazel_0.18.1-linux-x86_64.deb" && sudo dpkg -i bazel_*.deb
rm -f bazel_0.18.1-linux-x86_64.deb

git clone https://github.com/abseil/abseil-cpp.git
git clone -b "r1.12" https://github.com/tensorflow/tensorflow.git
cd ./tensorflow
./configure
# press Enter on all questions excepting the following:
# Do you wish to build TensorFlow with CUDA support? [y/N]: y
# Please specify the CUDA SDK version you want to use. [Leave empty to default to CUDA 9.0]: 10.0
bazel build --config=monolithic --copt=-Wno-sign-compare //tensorflow:libtensorflow_cc.so
# wait... about 1 hour
sudo mkdir /usr/local/include/tensorflow
sudo mkdir /usr/local/include/tensorflow/third_party
sudo cp -r ./tensorflow /usr/local/include/tensorflow
sudo cp -r ./bazel-genfiles/tensorflow /usr/local/include/tensorflow
sudo cp -r ../abseil-cpp/absl /usr/local/include/tensorflow/third_party
sudo cp -r ./third_party/eigen3 /usr/local/include/tensorflow/third_party
sudo cp ./bazel-bin/tensorflow/libtensorflow_cc.so /usr/local/lib
cd ../
rm -rf ./3.3.5.tar.bz2 ./abseil-cpp ./tensorflow

