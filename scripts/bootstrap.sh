# 判断.Qdotfiles仓库是否存在
# 拷贝.zshrc等“点文件”到家目录


#!/bin/bash
set -e
if [ $(whoami) = "root" ]; then
  SUDO=
else
  SUDO=sudo
fi

setup_color() {
  # Only use colors if connected to a terminal
  if [ -t 1 ]; then
    RED=$(printf '\033[31m')
    GREEN=$(printf '\033[32m')
    YELLOW=$(printf '\033[33m')
    BLUE=$(printf '\033[34m')
    BOLD=$(printf '\033[1m')
    RESET=$(printf '\033[m')
  else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    BOLD=""
    RESET=""
  fi
}

greeting() {
  setup_color
  printf "$GREEN"
  cat <<-'EOF'
 __________________________________
/          daxiongpro               \
| Hello, Welcome to use Qdotfiles!  |
| Useful tools:                     |
|   qdot -h                         | 
|   proxy -h                        |
\   qtool -h                        /
 ----------------------------------
                    _ooOoo_  
                   o8888888o  
                   88" . "88  
                   (| -_- |)  
                    O\ = /O  
                ____/`---'\____  
              .   ' \\| |// `.  
               / \\||| : |||// \  
             / _||||| -:- |||||- \  
               | | \\\ - /// | |  
             | \_| ''\---/'' | |  
              \ .-\__ `-` ___/-. /  
           ___`. .' /--.--\ `. . __  
        ."" '< `.___\_<|>_/___.' >'"".  
       | | : `- \`.;`\ _ /`;.`/ - ` : | |  
         \ \ `-. \_ __\ /__ _/ .-` / /  
 ======`-.____`-.___\_____/___.-`____.-'======  
                    `=---='  
 
 .............................................  

EOF
  printf "$RESET"
}

cp_file_if_exists() {
  if [ -f "$1" -a -e $2 ]; then
    cp "$1" "$2"
  elif [ -d "$1" -a -d $2 ]; then
    cp -r "$1" "$2"
  fi
}

pre_set() {
  # get variables in mac or linux
  unameOut="$(uname -s)"
  case "${unameOut}" in
  Linux*)
    if [ ! -d /usr/local/softwares/ ]; then
      echo INFO:Creating directory in /usr/local/softwares/, may need sudo priviledge
      $SUDO mkdir -p /usr/local/softwares/
      $SUDO chmod 777 -R /usr/local/softwares/
    fi
    ;;
  Darwin*)
    mkdir -p ~/applications/
    ;;
  *)
    echo "System not supported, support [mac|linux], abort!"
    exit 0
    ;;
  esac
}

check_project() {
  # initialization for the dotfiles project
  QDOTFILES=~/.Qdotfiles
  if [ ! -d "$QDOTFILES" ]; then
    git clone https://github.com/daxiongpro/Qdotfiles $QDOTFILES
    mkdir -p $QDOTFILES/downloads
  fi
  cd $QDOTFILES
}

setup_config() {

  # apt
  if [ `grep -c "ustc" /etc/apt/sources.list` -ne '0' ]; then # if do not exist ustc sources
    sudo cp apt/sources_zhongkeda.list /etc/apt
  fi

  # zshrc
  cp zsh/.zshrc ~
  cp_file_if_exists zsh/.zsh_profile ~

  # nvim
  # mkdir -p ~/.config/nvim && cp neovim/init.vim ~/.config/nvim
  cp_file_if_exists vim/.vimrc ~

  # tmux
  cp tmux/.tmux.conf ~

  # git
  # cp_file_if_exists git/.gitconfig ~
  # cp_file_if_exists git/.gitmessage ~
  # cp_file_if_exists git/.git-credentials ~

  # ssh
  cp_file_if_exists ssh/config ~/.ssh

  # python
  cp conda/.condarc ~
  cp -r pip ~/.pip

  # clash
  cp_file_if_exists clash ~
}

main() {
  greeting
  pre_set
  # 判断~/.Qdotfiles文件是否存在
  check_project
  # 把一些软件的配置文件放到home~目录下
  setup_config
#  exec zsh
}

main
