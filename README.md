<p align="center">
  <h3 align="center">daxiongproのdotfiles</h3>
  <p align="left">
   Development tools and dotfiles of daxiongpro, supporting mac and ubuntu in the same time.
  </br>
    <!-- a href="README_zh.md">ZH</a>|<a href="README.md">EN</a -->
  </p>
</p>

This repository is forked from [QiangZiBro](https://github.com/QiangZiBro)/**[Qdotfiles](https://github.com/QiangZiBro/Qdotfiles)** and I have made much changes to simplify the useage.

### Getting started

* Clone the repository

```bash
git clone git@gitee.com:daxiongpro/Qdotfiles.git ~/.Qdotfiles
```

* This repository is based on zsh, please install it first.

```bash
cd .Qdotfiles
bash scripts/init_a_fresh_ubuntu/2.oh-my-zsh_install.sh
```

* if you have just install the Ubuntu operating system, just follow [init fresh ubuntu tutorial](docs/init_fresh_ubuntu.md) to install softwares like `tmux`.
* do some preparations:

```bash
bash ~/.Qdotfiles/scripts/bootstrap.sh
```

Now, you can just use Qdotfiles!!!

---

### Make changes, and commit to your repository

```bash
qdot backup # copy your dotfiles to the Reponsitory
qdot push -m "changes" -t [master`|dev|HEAD]
```

### Proxy useage

Make a proxy on 8999 port in your linux computer. I recommand use clash. see [clash tutorial](docs/clash.md)

Proxy utilities in Qdotfiles

`proxy [on|off|up|status]`

### Repo structure

Each software owns a directory in root directory of the project, `install.sh` and `*.zsh` represent installation and software-wise comands.

### Command line support to manage dotfiles

We have a command named `qdot` or `q` to premote things to be done instantly, you can use a single command setup config in this repo to your computer

```bash
q b # qdot bootstrap
```

or use  `push`  or  `pull`  to remote git server

```bash
q [push|pull] [-m message -t <refspec>]
```

## Acknowledgement

[holman](https://github.com/holman)/**[dotfiles](https://github.com/holman/dotfiles)**

[mathiasbynens](https://github.com/mathiasbynens)/**[dotfiles](https://github.com/mathiasbynens/dotfiles)**

[Speed Up Oh-My-Zsh](https://bennycwong.github.io/post/speeding-up-oh-my-zsh/)
