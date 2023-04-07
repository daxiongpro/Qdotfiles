
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
    sudo apt install -f -y
    rm *edge*
    wget https://go.microsoft.com/fwlink\?linkid\=2149051 
    mv 'fwlink?linkid=2149051' edge.deb
    sudo dpkg -i edge.deb
  elif [ "$1" = "--wps" ]; then 
    # wps
    rm *wps*
    wget https://wdl1.cache.wps.cn/wps/download/ep/Linux2019/10702/wps-office_11.1.0.10702_amd64.deb
    sudo dpkg -i wps-office_11.1.0.10702_amd64.deb
  elif [ "$1" = "--pycharm-community" ]; then
    # pycharm-community
    sudo snap install pycharm-community --classic
  elif [ "$1" = "--pycharm-professional" ]; then
    # pycharm-professional
    sudo snap install pycharm-professional --classic
  elif [ "$1" = "--remmina" ]; then
    # remmina
    echo "please use apt/sources_zhongkeda.list"
    sudo apt-add-repository ppa:remmina-ppa-team/remmina-next
    sudo apt update
    sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret
  elif [ "$1" = "--miniconda" ]; then
    # miniconda
    bash ~/.Qdotfiles/conda/install.sh
  elif [ "$1" = "--vscode" ]; then
    # vscode 
    # reference: https://blog.csdn.net/sunzhao1000/article/details/120904566
    sudo apt update
    sudo apt install software-properties-common apt-transport-https wget
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo apt update
    sudo apt install code
  elif [ "$1" = "--wechat" ]; then
    # wechat
    sudo snap install electronic-wechat
  elif [ "$1" = "--shutter" ]; then
    # shutter
    sudo add-apt-repository ppa:shutter/ppa
    sudo apt-get update
    sudo apt-get install shutter
  else
    cat <<EOF
    Install some develope softwares
    --chrome
    --edge
    --wps
    --pycharm-community
    --pycharm-professional
    --remmina
    --miniconda
    --vscode
    --wechat
    --shutter
EOF
  fi
}

main $1
