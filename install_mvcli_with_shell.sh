#!/bin/sh

wget https://dl.dell.com/FOLDER04572610M/1/mvcli%204.1.13.31_A01.zip
unzip 'mvcli 4.1.13.31_A01.zip'
sudo cp 'mvcli 4.1.13.31_A01'/x64/cli/mvcli /usr/local/bin
sudo chmod 755 /usr/local/bin/mvcli
sudo cp 'mvcli 4.1.13.31_A01'/x64/cli/libmvraid.so /lib
