cd ~
mkdir src
cd src
git clone https://github.com/visualboyadvance-m/visualboyadvance-m.git
cd visualboyadvance-m
./installdeps
mkdir build
cd build
cmake ..
make -j`nproc`
echo "Grab a rom and a BIOS and some roms and have fun!"
