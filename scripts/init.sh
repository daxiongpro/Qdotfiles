source_oh_my_zsh()
{
    if [ -d $HOME/.oh-my-zsh ];then
      export ZSH=$HOME/.oh-my-zsh
      plugins=(
        git
        zsh-autosuggestions
        zsh-syntax-highlighting
        autojump
      )
      ZSH_THEME="robbyrussell"
      source $ZSH/oh-my-zsh.sh
    fi
}

source_oh_my_zsh_only_once()
{
  if [ ! -v IS_USING_OH_MY_ZSH ]; then
    # 多次 source 会变卡，设置环境变量 IS_USING_OH_MY_ZSH，避免重复 source
    echo "source oh_my_zsh."
    source_oh_my_zsh
    export IS_USING_OH_MY_ZSH=true
  fi
}

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

source_zsh()
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

export_var()
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

make_common_aliases () {
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
    # alias dsq="docker start qdot1804nvidia"
    # alias deq="docker exec -it qdot1804nvidia /bin/zsh"
    alias pycharm="sh /opt/pycharm-2022.2/bin/pycharm.sh"
}

main()
{
  export_var
  source_zsh
  make_common_aliases
  source_oh_my_zsh_only_once
}

main

