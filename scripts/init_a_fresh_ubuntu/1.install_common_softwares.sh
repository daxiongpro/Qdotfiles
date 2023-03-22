#!/bin/bash

ssh_install() {
  echo "ssh installing..."
  bash ../../ssh/install.sh
}

zsh_install() {
  echo "zsh and oh-my-zsh installing..."
  bash ../../zsh/install.sh
}

main() {
  if [ "$1" = "--ssh" ]; then
    ssh_install
  elif [ "$1" = "--zsh" ]; then
    zsh_install
  elif [ "$1" = "-c" ]; then
    softwares="git vim rdesktop ranger curl tree make snapd docker docker.io docker-compose autojump"
    echo "Hi handsome user! I will install some very common softwares you may need such as $softwares"
    sudo apt install -y $softwares
    bash ../../tmux/install.sh
  else
    cat <<EOF
    安装一些常规软件
    --ssh: 安装ssh，并开启22端口
    --zsh: 安装zsh和oh-my-zsh
    -c： 安装其他常规软件
EOF
  fi
}

main $1
