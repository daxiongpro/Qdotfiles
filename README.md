<p align="center">
  <h3 align="center">daxiongproのdotfiles</h3>
  <p align="center">
   Development tools and dotfiles of daxiongpro, supporting mac and ubuntu in the same time.
  </br>
    <a href="README_zh.md">ZH</a>|<a href="README.md">EN</a>
  </p>
</p>
## Presets:

Make a proxy on 8999 port in your linux computer. I recommand use clash.

[clash download](https://github.com/Dreamacro/clash/releases)

[clash usage](https://www.cnblogs.com/rogunt/p/15127947.html)

## Getting started

###### At first, you should make sure you have installed ssh, zsh, vim, etc. You can run following scripts directly.

```bash
sh scripts/init_a_fresh_ubuntu/{{ 1-10 }}.sh # install softwares
```

###### Secondly, you should run following command 

```bash
sh scripts/bootstrap.sh # copy "dotfiles" to your home dir "~"
```

###### Third, you should source .zshrc

```bash
source ~/.zshrc
```

###### Now, you can just use Qdotfiles!!!

------

Make changes, and commit to your repository

```bash
qdot backup # copy your dotfiles to the Reponsitory
qdot push -m "changes" -t [master`|dev|HEAD]
```

Proxy utilities in Qdotfiles

```bash
proxy [on|off|up|down|status|restart|cmd|set|which|test]
```



## Feature

### Synchronizing support for multi-servers

You can synchronize multiple servers by including ssh configuration in`.env` 

```
SERVERS="l0 l1 l2 l3 l4 l5 l6"
```

then you can manage multiple servers based on this file, e.g., update Qdotfiles of all servers from github:

```bash
qdot pull -r
```

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

