
if [ ! -d ~/Downloads ]; then
    mkdir ~/Downloads
fi
cd ~/Downloads


main() {
  if [ "$1" = "--chrome" ]; then 
    # chrome
    rm *google*
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb 

  elif [ "$1" = "--edge" ]; then
    # microsoft edge
    rm *edge*
    wget https://go.microsoft.com/fwlink\?linkid\=2149051 
    mv 'fwlink?linkid=2149051' edge.deb
    sudo apt install -f -y
    sudo dpkg -i edge.deb

 
  elif [ "$1" = "--wps" ]; then 
    # wps
    rm *wps*
    wget https://wdl1.cache.wps.cn/wps/download/ep/Linux2019/10702/wps-office_11.1.0.10702_amd64.deb
    sudo dpkg -i wps-office_11.1.0.10702_amd64.deb


  elif [ "$1" = "--pycharm" ]; then 
    # pycharm-community
    sudo snap install pycharm-community --classic
  elif [ "$1" = "--remmina" ]; then
    # remmina
    echo "please use apt/sources_zhongkeda.list"
    sudo apt-add-repository ppa:remmina-ppa-team/remmina-next
    sudo apt update
    sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret
  elif [ "$1" = "--miniconda" ]; then
    # miniconda
    bash ../../conda/install.sh
  elif [ "$1" = "--vscode" ]; then
    # vscode
    sudo snap install code --classic
  elif [ "$1" = "--wechat" ]; then
    # wechat
    sudo snap install electronic-wechat 
  else
    cat <<EOF
    Install some develope softwares
    --chrome
    --edge
    --wps
    --pycharm
    --remmina
    --miniconda
    --vscode
    --wechat
EOF
  fi
}

main $1
