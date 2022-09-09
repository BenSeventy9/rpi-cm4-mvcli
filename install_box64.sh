#!/bin/sh

sudo apt install git build-essential cmake
git clone https://github.com/ptitSeb/box64
cd box64
mkdir build; cd build; cmake .. -DRK3399=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
make -j4
sudo make install
sudo systemctl restart systemd-binfmt
