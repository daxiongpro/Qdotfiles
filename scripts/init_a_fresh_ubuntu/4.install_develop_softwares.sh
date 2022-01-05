# sudo snap install code --classic

# sudo snap install firefox chromium typora meshlab

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
# rm *pycharm*
# wget wget https://download-cdn.jetbrains.com/python/pycharm-community-2021.3.1.tar.gz
# sudo snap install pycharm-professional --classic
sudo snap install pycharm-community --classic


