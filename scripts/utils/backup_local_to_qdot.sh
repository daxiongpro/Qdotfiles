# 将家目录下的.文件复制到 .Qdotfiles 对应目录下
backup_local_to_qdot() {
  source ~/.Qdotfiles/scripts/utils/cp_file_if_exists.zsh
  root_dir=~/.Qdotfiles
  echo "root_dir:${root_dir}"
  cp_file_if_exists ~/.vimrc ${root_dir}/vim
  cp_file_if_exists ~/.tmux.conf ${root_dir}/tmux
  cp_file_if_exists ~/.zsh_profile ${root_dir}/zsh
  cp_file_if_exists ~/.ssh/config ${root_dir}/ssh

  # ~/.zshrc只放实验性的配置，不进行备份
}

main()
{
  backup_local_to_qdot
}

main