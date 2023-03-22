# 将 .Qdotfiles 的.文件复制到家目录下
backup_qdot_to_local() 
{
  source ~/.Qdotfiles/scripts/utils/cp_file_if_exists.zsh
  # apt
  # if [ `grep -c "ustc" /etc/apt/sources.list` -ne '0' ]; then # if do not exist ustc sources
  #   sudo cp apt/sources_zhongkeda.list /etc/apt
  # fi
  root_dir=~/.Qdotfiles
  echo "root_dir:${root_dir}"
  cp_file_if_exists ${root_dir}/zsh/.zshrc ~
  cp_file_if_exists ${root_dir}/vim/.vimrc ~
  cp_file_if_exists ${root_dir}/tmux/.tmux.conf ~
  cp_file_if_exists ${root_dir}/ssh/config ~/.ssh
  cp_file_if_exists ${root_dir}/conda/.condarc ~
  cp_file_if_exists ${root_dir}/pip/pip.conf ~/.pip

}

main()
{
  backup_qdot_to_local
}

main