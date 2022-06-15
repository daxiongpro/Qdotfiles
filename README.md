<div align="center">
	<img src="./image/README/fork.png" width = "200" alt="ubuntu logo" align=center />
	<p align="center">
	<h3 align="center">daxiongproのdotfiles</h3>
		<p align="center">
			Development tools and dotfiles of daxiongpro, help you use Ubuntu(Linux) easily!
		</br>
		*All scripts are tested on ubuntu 20.04 LTS.
		</p>
	</p>
</div>

### 🚀Init a fresh Ubuntu

* If you have just install the Ubuntu operating system, just follow [init fresh ubuntu tutorial](docs/init_fresh_ubuntu.md) to install softwares like `git,zsh,tmux` et al.
* All scripts about init new ubuntu OS is in `Qdotfiles/scripts/init_a_fresh_ubuntu/{{ 1-6 }}`.

### ☕Getting started

* See [github usage without proxy](docs/github.md)
* Clone the repository

```bash
git clone https://hub.fastgit.xyz/daxiongpro/Qdotfiles.git ~/.Qdotfiles
```

* This repository is based on zsh and oh-my-zsh, please make sure you have installed it firstly.

```bash
cd .Qdotfiles
bash zsh/install.sh
```

* Do some preparations:

```bash
bash ~/.Qdotfiles/scripts/bootstrap.sh
```

Now, you can just use Qdotfiles!!!

### 🍺Make changes, and commit to your repository

```bash
qdot backup # copy your dotfiles to the Reponsitory
qdot push -m "changes" -t [master|dev|HEAD]
```

### 🎧Proxy useage

Make a proxy on 8999 port in your linux computer. I recommand use clash. See [clash tutorial](docs/clash.md)

### 🎃Repo structure

Each software owns a directory in root directory of the project, `install.sh` and `*.zsh` represent installation and software-wise comands.

### ☃Command line support to manage dotfiles

We have a command named `qdot` or `q` to premote things to be done instantly, you can use a single command setup config in this repo to your computer

```bash
q b # qdot bootstrap
```

or use  `push`  or  `pull`  to remote git server

```bash
q [push|pull] [-m message] [-t <refspec>]
```

## Acknowledgement

[QiangZiBro](https://github.com/QiangZiBro)/[Qdotfiles](https://github.com/QiangZiBro/Qdotfiles)
