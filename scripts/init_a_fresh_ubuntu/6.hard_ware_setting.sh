# sudo fdisk -l
# sudo lsblk
sudo mount /dev/sda1 ~/1TB
# 设置卡机自动挂载
# 打开/etc/fstab, 设置如下：
# /dev/sdb /mnt/1TB ext4 defaults 0 0

# for hardware in $(realpath *TB*); do
#   hardware_name=$(basename $hardware)
#   for user in $(ls /home); do
#     dir="$hardware"/"$user"
#     linkdir=/home/"$user"/"$hardware_name"
# 
#     echo "$dir --> $linkdir"
#     mkdir -p $dir
#     ln -s $dir $linkdir
# 
#     chown -R "$user":deepones $dir
#     chown -R "$user":deepones -h $linkdir
#   done
# done
