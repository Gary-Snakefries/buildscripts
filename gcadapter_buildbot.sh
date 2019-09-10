#!/bin/bash
sudo apt-get install git libusb-dev
git clone https://github.com/ToadKing/wii-u-gc-adapter.git
cd wii-u-gc-adapter
make
