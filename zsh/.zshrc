export EDITOR=nvim

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

if [ -f ~/.Qdotfiles/scripts/init.sh ];then
	source ~/.Qdotfiles/scripts/init.sh
	proxy off
fi

