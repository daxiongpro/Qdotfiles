#---------------------------------------------------------------------------------
# 安装NVIDIA驱动的方式：
# 
# 方式1：
# 直接 bash ./cuda_install_preset.sh -i 安装cuda。安装cuda的同时会提示安装NVIDIA驱动
# 
# 方式2：
#	在https://developer.nvidia.com/cuda-downloads找到你的驱动runfile，下载，然后运行./cuda_*linux.run
# 
#---------------------------------------------------------------------------------

disable_nouveau() {
  cat <<EOF >>/etc/modprobe.d/blacklist-nouveau.conf
blacklist nouveau
options nouveau modeset=0
EOF

  update-initramfs -u
  reboot
}

install_basic_softwares() {
  # gcc-9为默认值，应该修改为gcc-7
  sudo apt-get install -y gcc-7 g++-7 

  if [ -f /usr/bin/gcc ]; then
	  sudo rm /usr/bin/gcc
  fi
  if [ -f /usr/bin/g++ ]; then
	  sudo rm /usr/bin/g++
  fi
  sudo ln -s /usr/bin/gcc-7 /usr/bin/gcc
  sudo ln -s /usr/bin/g++-7 /usr/bin/g++
  gcc -v
  g++ -v
}

cuda10_install() {
  if [ ! -d ~/Downloads ]; then
	  mkdir ~/Downloads
  fi
  cd ~/Downloads
    # 下载安装
  wget http://developer.download.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda_10.1.243_418.87.00_linux.run
  sudo sh cuda_10.1.243_418.87.00_linux.run


  echo "export PATH=/usr/local/cuda-10.1/bin/:$PATH" >> ~/.zshrc
  echo "export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64/:$LD_LIBRARY_PATH" >> ~/.zshrc

  echo "下面请手动 source ~/.zshrc"
}


main() {

  if [ "$1" = "-p" ]; then
    # preset
    install_basic_softwares
    disable_nouveau
    

  elif [ "$1" = "-i" ]; then
    cuda10_install
  else
    cat <<EOF
  设置cuda的脚本，具有安装必备软件和禁止nouveau的功能。

  这个脚本使用方法：
    bash ./cuda10_install.sh -p
      -p 默认下载必备软件、禁止nouveau并重启
    bash ./cuda10_install.sh -i
      -i 安装cuda10
      
EOF
    exit 0
  fi
}

main