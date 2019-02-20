#!/bin/bash
git clone -b "openh264v1.8" https://github.com/cisco/openh264.git
cd ./openh264
make -j 8
sudo make install-static
cd ../
rm -rf ./openh264
