#!/bin/bash
sudo apt install git make
git clone https://github.com/zturtleman/spearmint.git
cd spearmint
make
cd build
mv release-linux-x86_64 ~/"Quake III"
