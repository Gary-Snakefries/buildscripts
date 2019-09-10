if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
  echo "Connection is valid. proceeding"
else
  echo "Connectivity error"
  fi
mkdir darkplaces_build 
cd darkplaces_build
sudo apt-get install git
git clone https://github.com/xonotic/darkplaces.git
cd darkplaces
make release
echo "All set! Just grab your game files, run ./darkplaces-sdl, and enjoy!"
fi
