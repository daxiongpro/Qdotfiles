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

### ☕Clone the repository

* See [github usage without proxy](docs/github.md)

```bash
git clone https://github.com/daxiongpro/Qdotfiles.git ~/.Qdotfiles
```

### 🎧Proxy useage

Make a proxy on 8999 port in your linux computer. I recommand use clash. See [clash tutorial](docs/clash.md)

```bash
# Terminal 1
cd ~/.Qdotfiles
source clash/proxy.zsh
proxy download
proxy up

# Terminal 2
cd ~/.Qdotfiles
source clash/proxy.zsh
proxy up
proxy status

```

### 🍺ZSH install and use oh-my-zsh

* install zsh and oh-my-zsh
* copy .zshrc to home

* chsh from bash to zsh
* source .zshrc

```bash
cd ~/.Qdotfiles
sh scripts/init_a_fresh_ubuntu/1.install_common_softwares.sh --zsh
```

### ☃Bootstrap qdotfiles

We have a command named `qdot` or `q` to premote things to be done instantly, you can use a single command setup config in this repo to your computer

* greeting
* copy dotfiles to home
* source .zshrc

```bash
q b # qdot bootstrap
```

### 🍺Make changes, and commit to your repository

```bash
qdot backup # copy your dotfiles to the Reponsitory
qdot push -m "changes" -t [master|dev|HEAD]
```

### 🚀Init a fresh Ubuntu

* If you have just install the Ubuntu operating system, just follow [init fresh ubuntu tutorial](docs/init_fresh_ubuntu.md) to install softwares like `git,zsh,tmux` et al.
* All scripts about init new ubuntu OS is in `Qdotfiles/scripts/init_a_fresh_ubuntu/{{ 1-6 }}`.

### 🎃Repo structure

Each software owns a directory in root directory of the project, `install.sh` and `*.zsh` represent installation and software-wise comands.

## Acknowledgement

[QiangZiBro](https://github.com/QiangZiBro)/[Qdotfiles](https://github.com/QiangZiBro/Qdotfiles)
