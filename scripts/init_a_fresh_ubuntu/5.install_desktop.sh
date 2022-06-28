if [ ! -d "~/Downloads/" ];then
	mkdir ~/Downloads
fi
cd ~/Downloads

# ------------------------------------------------------------------------------
#
#               Ubuntu18.04上安装
#
# ------------------------------------------------------------------------------

wget -c http://c-nergy.be/downloads/xRDP/xrdp-installer-1.2.zip
unzip xrdp-installer-1.2.zip
chmod +x xrdp-installer-1.2.sh
./xrdp-installer-1.2.*

# 蓝色背景问题参考:https://github.com/quaggalinux/ubuntu18.04_desktop_fix_xorg_not_compatible
# 桌面卡顿问题参考：
# 1.https://blog.lopygo.com/2020/2020-04-27-remote-desktop-without-display/
# 2.https://www.sohu.com/a/446523786_495675

