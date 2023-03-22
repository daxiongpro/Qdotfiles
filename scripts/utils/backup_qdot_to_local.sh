# 将 .Qdotfiles 的.文件复制到家目录下
backup_qdot_to_local() {
  source ~/.Qdotfiles/scripts/utils/cp_file_if_exists.zsh
  # apt
  # if [ `grep -c "ustc" /etc/apt/sources.list` -ne '0' ]; then # if do not exist ustc sources
  #   sudo cp apt/sources_zhongkeda.list /etc/apt
  # fi
  cp_file_if_exists zsh/.zshrc ~
  cp_file_if_exists zsh/.zsh_profile ~
  cp_file_if_exists vim/.vimrc ~
  cp_file_if_exists tmux/.tmux.conf ~
  cp_file_if_exists ssh/config ~/.ssh
  cp_file_if_exists conda/.condarc ~
  cp_file_if_exists pip/pip.conf ~/.pip

}

function main()
{
  backup_qdot_to_local
}

main