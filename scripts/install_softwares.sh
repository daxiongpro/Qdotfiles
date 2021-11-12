#!/bin/bash
# Install working softwares
# Notes: Most of the softwares below needs command proxy,
#		 which can used by docker
# Args:
# -q : keep silent

change_apt_sources_and_update(){
	sources_dir = "/etc/apt/sources.list.back"
	if [ ! -f $sources_dir ]; then
		sudo mv /etc/apt/sources.list /etc/apt/sources.list.back
		sudo cp ~/.Qdotfiles/apt/sources.list /etc/apt/sources.list
	fi
	sudo apt update
}

change_apt_sources_and_update

cd "$(dirname $0)"/..

#if test "$(expr substr $(uname -s) 1 5)" = "Linux"
#then
#	# will install three kind of softwares
#	# bash scripts/init_new_machine/install_common_softwares.sh
#	# bash scripts/init_new_machine/install_develop_softwares.sh
#fi

# TODO: setup the proxy
for i in docker zsh neovim tmux homebrew; do
  echo installing $i
  if [ "$1" = "-q" ]; then
    bash $i/install.sh 2>&1 >/dev/null
  else
    bash $i/install.sh
  fi
done
