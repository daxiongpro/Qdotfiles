#!/bin/bash
set -ex

zsh_install()
{
  echo installing zsh
  sudo apt install zsh -y
}

oh_my_zsh_install()
{
  if [ ! -d ~/.oh-my-zsh ]; then
    echo installing oh_my_zsh
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  fi
}

zsh_plugin_install()
{
  # zsh plugins
  if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]; then

    git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  fi
  if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  fi
}

use_zsh()
{
  source ~/.Qdotfiles/scripts/utils/cp_file_if_exists.zsh
  cp_file_if_exists ~/.Qdotfiles/zsh/.zshrc ~
  chsh $USER -s $(which zsh)
  exec zsh
  source ~/.zshrc
  echo "please reboot"
}

main() {
  zsh_install
  oh_my_zsh_install
  zsh_plugin_install
  use_zsh
}

main