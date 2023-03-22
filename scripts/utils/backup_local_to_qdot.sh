# 将家目录下的.文件复制到 .Qdotfiles 对应目录下
function backup_local_to_qdot() {
  source ~/.Qdotfiles/scripts/utils/cp_file_if_exists.zsh
  cp_file_if_exists ~/.vimrc vim
  cp ~/.tmux.conf tmux
  cp_file_if_exists ~/.zsh_profile zsh
  cp_file_if_exists ~/.ssh/config ssh

  # ~/.zshrc只放实验性的配置，不进行备份
  # cp ~/.zshrc zsh
}

function main()
{
  backup_local_to_qdot
}

main