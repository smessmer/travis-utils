#!/bin/bash
set -ev

sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
sudo apt-get update -qq
if [ "$CXX" = "g++" ]; then sudo apt-get install -qq g++-$1; fi
if [ "$CXX" = "g++" ]; then export CXX="g++-$1" CC="gcc-$1"; fi   
if [ "$CXX" = "g++-$1" ]; then sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-$1 90; fi

