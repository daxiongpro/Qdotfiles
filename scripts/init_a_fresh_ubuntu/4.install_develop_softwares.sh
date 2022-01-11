
if [ ! -d ~/Downloads ]; then
    mkdir ~/Downloads
fi
cd ~/Downloads
# chrome
rm *google*
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb 

# wps
rm *wps*
wget https://wdl1.cache.wps.cn/wps/download/ep/Linux2019/10702/wps-office_11.1.0.10702_amd64.deb
sudo dpkg -i wps-office_11.1.0.10702_amd64.deb

# pycharm-community
sudo snap install pycharm-community --classic

# vscode
# sudo snap install code --classic

# remmina
echo "please use apt/sources_zhongkeda.list"
sudo apt-add-repository ppa:remmina-ppa-team/remmina-next
sudo apt update
sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret

