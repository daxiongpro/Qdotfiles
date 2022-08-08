#!/bin/bash


set -e
if test "$(uname)" = "Darwin"; then
  # mac installation branch
  brew install tmux

elif test "$(expr substr $(uname -s) 1 5)" = "Linux"; then
  sudo apt install tmux
fi

# tmux plug manager
if [ ! -d ~/.tmux/plugins/ ]; then
  mkdir -p ~/.tmux/plugins/
fi

if [ ! -d ~/.tmux/plugins/tpm ]; then
  # 进入相应位置
  cd ~/.tmux/plugins/
  git clone https://hub.fastgit.xyz/tmux-plugins/tpm

  # 下载插件
  git clone https://hub.fastgit.xyz/tmux-plugins/tmux-resurrect.git # 保存tmux会话到disk
  git clone https://hub.fastgit.xyz/tmux-plugins/tmux-continuum.git # 定时保存，自动加载
fi
tmux source ~/.tmux.conf

exit 0
