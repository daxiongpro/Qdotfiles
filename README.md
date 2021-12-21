<p align="center">
  <h3 align="center">daxiongproのdotfiles</h3>
  <p align="center">
   Development tools and dotfiles of daxiongpro, supporting mac and ubuntu in the same time.
  </br>
    <!-- a href="README_zh.md">ZH</a>|<a href="README.md">EN</a -->
  </p>
</p>

### Getting started

```bash
git clone git@gitee.com:daxiongpro/Qdotfiles.git .Qdotfiles

cd .Qdotfiles/scripts

bash bootstrap.sh
```

Now, you can just use Qdotfiles!!!

---

### Make changes, and commit to your repository

```bash
qdot backup # copy your dotfiles to the Reponsitory
qdot push -m "changes" -t [master`|dev|HEAD]
```

### Init fresh ubuntu

[init fresh ubuntu tutorial](docs/init_fresh_ubuntu.md)

### proxy

Make a proxy on 8999 port in your linux computer. I recommand use clash. see [clash tutorial](docs/clash.md)

Proxy utilities in Qdotfiles

`proxy [on|off|status]`

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

QiangZiBro/[Qdotfiles](https://github.com/QiangZiBro/Qdotfiles)

[holman](https://github.com/holman)/**[dotfiles](https://github.com/holman/dotfiles)**

[mathiasbynens](https://github.com/mathiasbynens)/**[dotfiles](https://github.com/mathiasbynens/dotfiles)**

[Speed Up Oh-My-Zsh](https://bennycwong.github.io/post/speeding-up-oh-my-zsh/)
