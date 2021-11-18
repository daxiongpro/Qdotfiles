if [ ! -d "~/Downloads/" ];then
	mkdir ~/Downloads
fi
cd ~/Downloads

# -------------------------------------------------------------------
# ubuntu 18.04 远程桌面安装脚本，安装完登录后只有蓝色背景，舍弃该方法
# -------------------------------------------------------------------
# go to http://www.c-nergy.be/products.html
set -e
# wget -c http://c-nergy.be/downloads/xRDP/xrdp-installer-1.2.zip
# unzip xrdp-installer-1.2.zip
# bash xrdp-installer-1.2.sh
# rm xrdp-installer-1.2.*

# or

# wget http://www.c-nergy.be/downloads/install-xrdp-3.0.zip
# unzip install-xrdp-3.0.zip
# chmod 777 Install-xrdp-3.0.sh
# ./Install-xrdp-3.0.sh
# rm install-xrdp-3.p.*
# -------------------------------------------------------------------

#               这两种方法都是在Ubuntu18.04上安装

# -------------------------------------------------------------------
# -----说能解决，ubuntu18.04 只显示蓝色背景问题，亲测也无效----------
# -------------------------------------------------------------------
# #下载脚本
# wget http://www.c-nergy.be/downloads/Std-Xrdp-Install-0.5.3.zip
# #解压压缩包
# unzip Std-Xrdp-Install-0.5.3.zip
# #赋予执行权限
# chmod +x Std-Xrdp-Install-0.5.3.sh
# #执行完成后就行了
# ./Std-Xrdp-Install-0.5.3.sh
# -------------------------------------------------------------------



#                    在Ubuntu20.04上安装


# 在Ubuntu20.04中成功安装桌面

# 卸载xfce4会卡住不动，卸载dbus-x11登录会黑屏
sudo apt install xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils -y
# 亲测卸载xorgxrdp登录会蓝屏 
sudo apt install xrdp xorgxrdp -y
# sudo apt install xorg-video-abi-24 -y
sudo xrdp --version
# 启动远程桌面
sudo systemctl enable xrdp
sudo systemctl start xrdp
sudo systemctl status xrdp
sudo chmod 666 /etc/xrdp/xrdp.ini
sudo echo "exec startxfce4" >> /etc/xrdp/xrdp.ini
sudo systemctl restart xrdp
# 配置防火墙
sudo ufw allow 3389




# # 增加xrdp源
# add-apt-repository ppa:martinx/xrdp-next
# sudo apt update
# # apt不能解决依赖冲突，aptitude可以，先安装aptitude
# sudo apt-get install aptitude



