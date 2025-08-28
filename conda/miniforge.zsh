_set_env(){
if test "$(expr substr $(uname -s) 1 5)" = "Linux"
then
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/usr/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/usr/minoforge3/etc/profile.d/conda.sh" ]; then
            . "/usr/minoforge3/etc/profile.d/conda.sh"
        else
            export PATH="/usr/minoforge3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
fi
}

_set_env


function conda_mv(){
	if [ -z "$1" ] || [ -z "$2" ];then
		echo "Usage: conda_mv old new"
	else
		conda create --name $2 --clone $1 -y
		conda remove --name $1 --all -y 
	fi
}

