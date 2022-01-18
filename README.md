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
* All scripts about init new ubuntu OS is in `Qdotfiles/scripts/init_a_fresh_ubuntu/{{ 1-10 }}`. {{ 1-3 }} are required，{{ 4-10 }} can be executed as you want!

### ☕Getting started

* Clone the repository

```bash
git clone git@gitee.com:daxiongpro/Qdotfiles.git ~/.Qdotfiles
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

---

### 🍺Make changes, and commit to your repository

```bash
qdot backup # copy your dotfiles to the Reponsitory
qdot push -m "changes" -t [master|dev|HEAD]
```

### 🎧Proxy useage

Make a proxy on 8999 port in your linux computer. I recommand use clash. See [clash tutorial](docs/clash.md)

Proxy utilities in Qdotfiles

`proxy [on|off|up|status]`

```
➜  ~ proxy on
➜  ~ proxy status
--------------
Proxy setting
--------------
http_proxy=127.0.0.1:8999
https_proxy=127.0.0.1:8999
HTTP_PROXY=127.0.0.1:8999
HTTPS_PROXY=127.0.0.1:8999
--------------
Network test
--------------
[0.00 s] baidu :200 OK✅
[1.00 s] google:200 OK✅
➜  ~
➜  ~
➜  ~ proxy off
➜  ~ proxy status
--------------
Proxy setting
--------------
http_proxy=
https_proxy=
HTTP_PROXY=
HTTPS_PROXY=
--------------
Network test
--------------
[1.00 s] baidu :200 OK✅
[3.00 s] google:None�
➜  ~
```

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

[holman](https://github.com/holman)/[dotfiles](https://github.com/holman/dotfiles)

[mathiasbynens](https://github.com/mathiasbynens)/[dotfiles](https://github.com/mathiasbynens/dotfiles)

[Speed Up Oh-My-Zsh](https://bennycwong.github.io/post/speeding-up-oh-my-zsh/)
