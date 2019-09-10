#!/bin/bash
mkdir zandronum_build
cd zandronum_build
sudo apt-get install g++ make cmake libsdl1.2-dev mercurial zliblg-dev libbz2-dev libjpeg-dev libfluidsynth-dev libgtk2.0-dev timidity nasm libgl1-mesa-dev libssl-dev tar libglew-dev
sudo apt-get install doom-wad-shareware
hg clone https://bitbucket.org/Torr_Samaho/zandronum
cd zandronum
mkdir -pv buildclient buildserver
mkdir -pv zandronum_client zandronum_server
a='' && [ "$(uname -m)" = x86_64 ] && a=64
cd ~/zandronum_build &&
wget -nc http://zandronum.com/essentials/fmod/fmodapi42416linux${a}.tar.gz &&
tar -xvzf fmodapi42416linux${a}.tar.gz -C zandronum
a='' && [ "$(uname -m)" = x86_64 ] && a=64
c="$(lscpu -p | grep -v '#' | sort -u -t , -k 2,4 | wc -l)" ; [ "$c" -eq 0 ] && c=1
cd ~/zandronum_build/zandronum/buildclient &&
rm -f output_sdl/liboutput_sdl.so &&
if [ -d "../fmodapi42416linux${a}" ]; then
f="-DFMOD_LIBRARY=../fmodapi42416linux${a}/api/lib/libfmodex${a}-4.24.16.so \
-DFMOD_INCLUDE_DIR=../fmodapi42416linux${a}/api/inc"; else
f='-UFMOD_LIBRARY -UFMOD_INCLUDE_DIR'; fi &&
cmake .. -DCMAKE_BUILD_TYPE=Release -DSERVERONLY=OFF -DRELEASE_WITH_DEBUG_FILE=OFF $f &&
make -j$c
cd /usr/share/games/doom
sudo cp doom1.wad ~/zandronum_build/zandronum/buildserver
sudo cp doom1.wad ~/zandronum_build/zandronum/buildclient
cd ~/zandronum_build/zandronum
cp buildserver buildclient ~/Downloads
cd ~/Downloads
mv buildserver zandronum_server
mv buildclient zandronum_client
