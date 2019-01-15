#!/bin/bash

echo "get binary and untar"
wget https://github.com/mimblewimble/grin/releases/download/v0.5.2/grin-v0.5.2-478131988-linux-amd64.tgz
tar -xvf grin-v0.5.2-478131988-linux-amd64.tgz
sudo mv grin /usr/local/bin/grin
rm grin-v0.5.2-478131988-linux-amd64.tgz

echo "Install Stuff"
sudo apt-get -y install build-essential cmake git libgit2-dev clang libncurses5-dev libncursesw5-dev zlib1g-dev pkg-config libssl-dev llvm

echo "to Run Grin on testnet"
echo "grim --floonet"
echo "To Create Wallet"
echo "grim --floonet wallet init" 
