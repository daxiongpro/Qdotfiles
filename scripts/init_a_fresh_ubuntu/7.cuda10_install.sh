#!/bin/bash

if [ ! -d ~/Downloads ]; then
	mkdir ~/Downloads
fi
cd ~/Downloads
# gcc-9为默认值，应该修改为gcc-7
sudo apt install gcc-7
sudo rm /usr/bin/gcc
sudo ln -s /usr/bin/gcc-7 /usr/bin/gcc
gcc -v


# 下载安装
wget http://developer.download.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda_10.1.243_418.87.00_linux.run
sudo sh cuda_10.1.243_418.87.00_linux.run


echo "export PATH=/usr/local/cuda-10.1/bin/:$PATH" >> ~/.zshrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64/:$LD_LIBRARY_PATH" >> ~/.zshrc

echo "下面请手动 source ~/.zshrc"



