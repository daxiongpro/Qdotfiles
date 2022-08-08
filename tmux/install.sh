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
  # ������Ӧλ��
  cd ~/.tmux/plugins/
  git clone https://hub.fastgit.xyz/tmux-plugins/tpm

  # ���ز��
  git clone https://hub.fastgit.xyz/tmux-plugins/tmux-resurrect.git # ����tmux�Ự��disk
  git clone https://hub.fastgit.xyz/tmux-plugins/tmux-continuum.git # ��ʱ���棬�Զ�����
fi
tmux source ~/.tmux.conf

exit 0
