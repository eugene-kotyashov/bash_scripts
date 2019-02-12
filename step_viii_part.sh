#!/bin/bash
#git clone -b "r1.12" https://github.com/tensorflow/tensorflow.git
cd ./tensorflow
./configure
# press Enter on all questions excepting the following:
# Do you wish to build TensorFlow with CUDA support? [y/N]: y
# Please specify the CUDA SDK version you want to use. [Leave empty to default to CUDA 9.0]: 10.0
bazel build --jobs 1 --config=monolithic --copt=-mavx --copt=-mavx2 --copt=-mfma --copt=-msse4.1 --copt=-msse4.2 --copt=-Wno-sign-compare //tensorflow:libtensorflow_cc.so
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

