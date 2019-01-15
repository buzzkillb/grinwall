#!/bin/bash
TEMP=/tmp/answer$$
whiptail --title "grin"  --menu  "grin wallet getter :" 20 0 0 1 "Get Grin Binary" 2 "Compile Grin Binary" 2>$TEMP
choice=`cat $TEMP`
case $choice in

        1)      echo 1 "Get Grin Binary"
				echo "Updating linux packages"
				sudo apt-get update -y && apt-get upgrade -y
				
				echo "get binary and untar"
				mkdir download
				cd download
				wget https://github.com/mimblewimble/grin/releases/download/v1.0.0/grin-v1.0.0-479973573-linux-amd64.tgz
				tar -xvf grin-v1.0.0-479973573-linux-amd64.tgz
				sudo mv grin /usr/local/bin/grin
				rm grin-v1.0.0-479973573-linux-amd64.tgz
				cd ~

				echo "Install Stuff"
				sudo apt-get -y install build-essential cmake git libgit2-dev clang libncurses5-dev libncursesw5-dev zlib1g-dev pkg-config libssl-dev llvm

				echo "to Run Grin"
				echo "$(tput setaf 6)grin$(tput sgr0)"
				echo "To Create Wallet"
				echo "$(tput setaf 6)grin wallet init$(tput sgr0)"
				;;

        2)      echo 2 "Compile Grin Binary"
				echo "Updating linux packages"
				sudo apt-get update -y && apt-get upgrade -y
				sudo apt-get install -y cargo
				curl https://sh.rustup.rs -sSf | sh -s -- -y
				source $HOME/.cargo/env
				git clone https://github.com/mimblewimble/grin.git
				cd grin
				cargo build --release
				sudo mv ~/grin/target/release/grin /usr/local/bin/grin

				echo "Install Stuff"
				sudo apt-get -y install build-essential cmake git libgit2-dev clang libncurses5-dev libncursesw5-dev zlib1g-dev pkg-config libssl-dev llvm

				echo "to Run Grin"
				echo "$(tput setaf 6)grin$(tput sgr0)"
				echo "To Create Wallet"
				echo "$(tput setaf 6)grin wallet init$(tput sgr0)"
                ;;
esac
echo Selected $choice
