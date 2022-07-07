#!/bin/bash

# 交互式模式的初始化脚本
# 防止被加载两次
if [ -z "$_INIT_SH_LOADED" ]; then
  _INIT_SH_LOADED=1
else
  return
fi

# 如果是非交互式则退出，比如 bash test.sh 这种调用 bash 运行脚本时就不是交互式
# 只有直接敲 bash 进入的等待用户输入命令的那种模式才成为交互式，才往下初始化
case "$-" in
*i*) ;;
*) return ;;
esac

source_if_exists() {
  file="$1"

  if [ -f "$file" ]; then
    source "$file"
  fi
}


export PATH=$PATH:~/.Qdotfiles/bin
QDOTFILES="~/.Qdotfiles"

# proxy
source ~/.Qdotfiles/clash/proxy.zsh

# zsh
source_if_exists ~/.Qdotfiles/zsh/.zsh_profile

# conda
source ~/.Qdotfiles/conda/conda.zsh

# docker
source ~/.Qdotfiles/docker/docker.zsh

# tmux
source ~/.Qdotfiles/tmux/tmux.zsh

# ros1
if [ -f "/opt/ros/melodic/setup.zsh" ]; then
    source /opt/ros/melodic/setup.zsh
fi

if [ -f "/opt/ros/noetic/setup.zsh" ]; then
    source /opt/ros/noetic/setup.zsh
fi

# ros2
if [ -f "/opt/ros/foxy/setup.zsh" ]; then
    source /opt/ros/foxy/setup.zsh
fi

# 整理 PATH，删除重复路径
if [ -n "$PATH" ]; then
  old_PATH=$PATH:
  PATH=
  while [ -n "$old_PATH" ]; do
    x=${old_PATH%%:*}
    case $PATH: in
    *:"$x":*) ;;
    *) PATH=$PATH:$x ;;
    esac
    old_PATH=${old_PATH#*:}
  done
  PATH=${PATH#:}
  unset old_PATH x
fi

export PATH
