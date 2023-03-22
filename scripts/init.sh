

function source_()
{
  source ~/.Qdotfiles/scripts/utils/source_if_exists.zsh

  export PATH=$PATH:~/.Qdotfiles/bin
  QDOTFILES="~/.Qdotfiles"
  source_if_exists ~/.Qdotfiles/clash/proxy.zsh
  source_if_exists ~/.Qdotfiles/zsh/.zsh_profile
  source_if_exists ~/.Qdotfiles/conda/conda.zsh
  source_if_exists ~/.Qdotfiles/docker/docker.zsh
  source_if_exists ~/.Qdotfiles/tmux/tmux.zsh
  source_if_exists ~/.Qdotfiles/host/hosts.zsh
  # ros
  source_if_exists /opt/ros/melodic/setup.zsh
  source_if_exists /opt/ros/noetic/setup.zsh
  source_if_exists /opt/ros/foxy/setup.zsh

}

function _delete_redundant_path()
{
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
}

function export_()
{
  export CUDA_HOME=/usr/local/cuda
  export PATH=$PATH:$CUDA_HOME/bin
  export LD_LIBRARY_PATH=/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

  # WSL rviz
  export LIBGL_ALWAYS_INDIRECT=0 
  _delete_redundant_path
  export PATH
}

function main()
{
  source_
  export_
}

main

