# sudo snap install pycharm-professional --classic
# sudo snap install pycharm-community --classic
# sudo snap install code --classic

# sudo snap install firefox chromium typora meshlab

if [ ! -d ~/Downloads ]; then
    mkdir ~/Downloads
fi
cd ~/Downloads
# chrome
rm google*
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb 
