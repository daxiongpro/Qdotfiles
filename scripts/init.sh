
_delete_redundant_path()
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

source_()
{
  source ~/.Qdotfiles/scripts/utils/source_if_exists.zsh

  QDOTFILES="~/.Qdotfiles"
  source_if_exists ~/.Qdotfiles/clash/proxy.zsh
  source_if_exists ~/.Qdotfiles/conda/conda.zsh
  source_if_exists ~/.Qdotfiles/docker/docker.zsh
  source_if_exists ~/.Qdotfiles/tmux/tmux.zsh
  source_if_exists ~/.Qdotfiles/host/hosts.zsh
  # ros
  source_if_exists /opt/ros/melodic/setup.zsh
  source_if_exists /opt/ros/noetic/setup.zsh
  source_if_exists /opt/ros/foxy/setup.zsh

}

export_()
{
  export PATH=$PATH:~/.Qdotfiles/bin
  export CUDA_HOME=/usr/local/cuda
  export PATH=$PATH:$CUDA_HOME/bin
  #CUDA
	if [ -d "/usr/local/cuda/bin" ];then
		export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}
		export LD_LIBRARY_PATH=/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
	fi
  # WSL rviz
  export LIBGL_ALWAYS_INDIRECT=0 
  _delete_redundant_path
  export PATH
}

common_aliases () {
    alias ei="vim ~/.Qdotfiles/scripts/init.sh"
    alias q="qdot"
    alias sb="source ~/.zshrc"
    alias eb="vim ~/.zshrc"
    alias cz="cd ~/.Qdotfiles/zsh/"
    alias cq="cd ~/.Qdotfiles/"
    alias start="nautilus"
    alias wn="watch -n 1 nvidia-smi"
    alias cinit="cd ~/.Qdotfiles/scripts/init_a_fresh_ubuntu"
    alias nrst="sudo /etc/init.d/networking restart" # network restart 修改host后生效
    alias dsq="docker start qdot1804nvidia"
    alias deq="docker exec -it qdot1804nvidia /bin/zsh"
    alias pycharm="sh /opt/pycharm-2022.2/bin/pycharm.sh"
}

main()
{
  source_
  export_
  common_aliases
}

main

