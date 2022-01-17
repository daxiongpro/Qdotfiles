#!/bin/bash
set -ex

if test "$(uname)" = "Darwin"; then
  # mac installation branch
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

elif test "$(expr substr $(uname -s) 1 5)" = "Linux"; then
  echo installing zsh
  # linux installation branch

  sudo apt install zsh -y
  if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh}" ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  fi
  cp ~/.Qdotfiles/zsh/.zshrc ~/.zshrc
  chsh $USER -s $(which zsh)
  # zsh plugins
  if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
 
  	git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  fi
  if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
  	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  fi

  exec zsh
  source ~/.zshrc
  echo "please reboot"

fi

