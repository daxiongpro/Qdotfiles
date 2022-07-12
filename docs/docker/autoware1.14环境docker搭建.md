###搭建autoware1.14环境docker
###autoware1.14版本所需依赖：GCC7、G++7、openCV3.x、qt5.14.2、cuda10.0

##1.基础环境搭建
#1.1pull基础镜像（18.04+cuda+opengl）并开启容器
'
docker pull nvidia/cudagl:11.3.0-runtime-ubuntu18.04
docker run --gpus all -it  -p 10001:22 -v /home/junjie-pc/Project:/hostdata -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -e GDK_SCALE -e GDK_DPI_SCALE nvidia/cudagl:11.3.0-runtime-ubuntu18.04 /bin/bash
'
#1.2换源
'
apt-get update
apt-get install vim
cp /etc/apt/sources.list /etc/apt/sources.list.bak
vim /etc/apt/sources.list
'
#1.3替换
deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
#1.4更新
'
apt-get update
'


##2.安装gcc7、g++7
#2.1安装gcc7,g++7
'
apt-get install gcc-7 gcc-7-multilib
apt-get install g++-7 g++-7-multilib
'
#2.2查看系统中gcc和g++版本
'
ls /usr/bin/gcc*
ls /usr/bin/g++*
'
#2.3版本切换
'
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 100
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 50
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 100
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 50
'
#2.4查看默认版本
'
update-alternatives --config gcc
update-alternatives --config g++
'
#2.5再次确认
'
gcc --version
g++ --version
'


##3.安装cuda10.0和cudnn7.6.5（主机已安装显卡驱动）
#3.1卸载docker中的cuda11,参考https://blog.csdn.net/qq_42518956/article/details/108358254
#3.2拷贝cuda10.0安装包到docker
#3.3通过安装包安装cuda10.0(若报错：BEGIN failed--compilation aborted at .cuda-installer.pl line 5，'apt install freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libgl1-mesa-glx libglu1-mesa libglu1-mesa-dev libglfw3-dev libgles2-mesa-dev',参考https://blog.csdn.net/weixin_44912159/article/details/108020165)
'
sh cuda_10.2.89_440.33.01_linux.run 
'
#3.4继续3.3安装，注意安装显卡驱动选择no
#3.5添加环境变量
'
vim ~/.bashrc
'
#3.6添加内容
'
export CUDA_HOME=/usr/local/cuda 
export PATH=$PATH:$CUDA_HOME/bin 
export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
'
#3.7保存并退出
'
source ~/.bashrc
'
#3.8解压并拷贝cudnn到docker中
'
docker cp cudnn-10.0-linux-x64-v7.6.5.32 d740c5c4d267:/root/
'
#3.9复制文件并赋予权限
'
cp cuda/include/cudnn.h /usr/local/cuda/include/
cp cuda/lib64/libcudnn* /usr/local/cuda/lib64/
chmod a+r /usr/local/cuda/include/cudnn.h
chmod a+r /usr/local/cuda/lib64/libcudnn*
'
#3.10测试cuda
'
cd /usr/local/cuda/samples/1_Utilities/deviceQuery 
sudo make
./deviceQuery
'
#4.11测试cudnn
'
cat /usr/local/cuda/include/cudnn.h | grep CUDNN_MAJOR -A 2
'
#4.12gpu使用测试(记得常保存镜像'docker commit [container ID] [images name]:[tag]')
'
nvidia-smi
'

##5.安装ROS melodic(若上步保存了镜像，则打开新容器'docker run --gpus all -it  -p 10001:22 -v /home/junjie-pc/Project:/hostdata -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -e GDK_SCALE -e GDK_DPI_SCALE [images name]:[tag] /bin/bash')
#5.1添加ROS软件源(若提示lsb_release: not found，参考https://blog.csdn.net/lun55423/article/details/108974443)
'
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
'
#5.2添加密钥
'
apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
'
#5.3安装ROS
'
apt-get update
apt-get install ros-melodic-desktop-full
'
#5.4初始化rosdep(提示rosdep: command not found，执行'apt install python-rosdep';报Website may be down，参考https://zhuanlan.zhihu.com/p/110151098;报错ERROR: unable to process source，尝试切换手机热点)
'
rosdep init
rosdep update
'
#5.5设置环境变量
'
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc
'
#5.6测试
'
roscore
'
#5.7另开终端测试rviz是否显示(记得常保存镜像'docker commit [container ID] [images name]:[tag]')
'
docker exec -it [container ID] bash
rosrun rviz rviz
'


##6.安装qt5.14.2((若上步保存了镜像，则打开新容器'docker run --gpus all -it  -p 10001:22 -v /home/junjie-pc/Project:/hostdata -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -e GDK_SCALE -e GDK_DPI_SCALE [images name]:[tag] /bin/bash'))
#6.1拷贝安装包到docker
'
sudo docker cp qt-opensource-linux-x64-5.14.2.run d1dbabd517b4:/root/
'
#6.2安装
'
sudo chmod a+x qt-opensource-linux-x64-5.11.1.run
./qt-opensource-linux-x64-5.11.1.run
'


##7.安装autoware1.14
#7.1安装系统依赖：
'
apt update
apt install -y python-catkin-pkg python-rosdep ros-$ROS_DISTRO-catkin
apt install -y python3-pip python3-colcon-common-extensions python3-setuptools python3-vcstool
pip3 install -U setuptools
'
#7.2拷贝eigen3.3.7压缩包至容器
'
sudo docker cp eigen-3.3.7.zip d1dbabd517b4:/home/
'
#7.3解压
'
tar -xvf eigen-3.3.7.tar
'
#7.4新建build并完成编译安装
'
mkdir eigen-3.3.7/build
cd eigen-3.3.7/build/
cmake .. 
make 
make install
'
#7.5创建工作空间
'
mkdir -p autoware.ai/src
cd autoware.ai
'
#7.6下载autoware.ai的工作空间的配置
'
wget -O autoware.ai.repos "https://raw.githubusercontent.com/Autoware-AI/autoware.ai/1.14.0/autoware.ai.repos"
'
#7.7下载autoware.ai到工作区（报错Could not determine ref type of version，参考https://blog.csdn.net/qq_39537898/article/details/112347370）
'
vcs import src < autoware.ai.repos
'
#7.8配置安装环境(若安装ros时已update过，第一步可跳过)
'
rosdep update
rosdep install -y --from-paths src --ignore-src --rosdistro $ROS_DISTRO
'
#7.9编译安装(若安装了anaconda，可能会报错：//root/anaconda3/lib/libfontconfig.so.1: undefined reference to `FT_Done_MM_Var' ……[CMakeFiles/pixel_cloud_fusion.dir/all] Error……，参考https://blog.csdn.net/weixin_43958086/article/details/108635371，记得保存镜像)
'
AUTOWARE_COMPILE_WITH_CUDA=1 colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release
'
#7.10验证（大坑）
'
cd /hostdata/autoware.ai
source ./install/setup.bash
roslaunch runtime_manager runtime_manager.launch
'
#7.10.1问题：--geometry=50x10+500+0: command not found,
#填坑：'sudo apt-get install gnome'，参考https://blog.csdn.net/tiatiatiatia/article/details/106880488
 
#7.10.2问题：Couldn't connect to accessibility bus: Failed to connect to socket /tmp/dbus-tsPT8Kkuce: Connection refused,
#填坑：尝试用host模式重开容器，发现错误神奇地没了
'
docker run --gpus all -it  -p 10001:22 -v /home/junjie-pc/Project:/hostdata -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -e GDK_SCALE -e GDK_DPI_SCALE --net=host --privileged=true [images name]:[tag] /bin/bash
'
#7.10.3问题：终端无报错，log中报gnome-terminal错误：error constructing proxy for org.gnome……
#填坑：参考：https://blog.csdn.net/Mr__G/article/details/54092532。如果运行'gnome-terminal'已报错，如下设置后依旧会报错,所以开启容器后直接修改编码，再测试gnome-terminal。玄学问题……
#查看编码
'
locale
'
#修改编码
'
export LC_ALL='en_US.UTF-8'
'
#修改变量
'vim /etc/default/locale'
#改为
'
LANG="en_US.UTF-8"
LANGUAGE="en_US:en"
'
#保存并重新打开容器
'
docker commit [container ID] [images name]:[tag
docker run --gpus all -it  -p 10001:22 -v /home/junjie-pc/Project:/hostdata -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -e GDK_SCALE -e GDK_DPI_SCALE --net=host --privileged=true autoware:test8.9.3 /bin/bash
'
#容器中修改编码并测试(千万别手贱先测试)
'
locale
export LC_ALL='en_US.UTF-8'
gnome-terminal
'
#返回7.10测试runtime_manager,界面能显示，撒花
'
cd /hostdata/autoware.ai
source ./install/setup.bash
roslaunch runtime_manager runtime_manager.launch
'

#8.安装yolo2、yolo3
'
cd autoware.ai/install/vision_darknet_detect/share/vision_darknet_detect/darknet/
mkdir data 
cd data
wget https://pjreddie.com/media/files/yolov3.weights
wget https://pjreddie.com/media/files/yolov2.weights
'
#9.安装SSDcafe
#9.1安装 pre-compiled Caffe，支持CUDA的GPU版本：
'
apt install caffe-cuda
'
#9.2然后安装相关依赖：
'
apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev
apt-get install libhdf5-serial-dev protobuf-compiler
apt-get install --no-install-recommends libboost-all-dev
apt-get install libatlas-base-dev
apt-get install python-dev
apt-get install libgflags-dev libgoogle-glog-dev liblmdb-dev
'
#9.3下载SSDcafe源码(暂未实现)
'
git clone -b ssd https://github.com/weiliu89/caffe.git ssdcaffe
cd ssdcaffe
git checkout 4817bf8b4200b35ada8ed0dc378dceaf38c539e4
'
#9.4拷贝Makefile.config.example的一个副本并改名为Makefile.config
'
cp Makefile.config.example Makefile.config
'
#9.5修改Makefile.config
'
USE_CUDNN := 1
USE_OPENCV := 1
OPENCV_VERSION := 3
CUDA_ARCH := -gencode arch=compute_30,code=sm_30 \
             -gencode arch=compute_35,code=sm_35 \
             -gencode arch=compute_50,code=sm_50 \
             -gencode arch=compute_52,code=sm_52 \
             -gencode arch=compute_61,code=sm_61

INCLUDE_DIRS := $(PYTHON_INCLUDE) /usr/local/include  /usr/include/hdf5/serial/
LIBRARY_DIRS := $(PYTHON_LIB) /usr/local/lib /usr/lib /usr/lib/x86_64-linux-gnu /usr/lib/x86_64-linux-gnu/hdf5/serial
'
#编9.6译
'
make && make distribute
'
#9.7编译autoware
'
AUTOWARE_COMPILE_WITH_CUDA=1 colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release
'

##10.保存镜像
'
docker commit 969226cfc7cb autoware1.14:zhou
docker save -o autoware1.14:tar autoware1.14:zhou
'
