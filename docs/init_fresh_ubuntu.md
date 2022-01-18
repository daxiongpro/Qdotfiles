## Init a fresh Ubuntu!

###### At first, you should make sure you have installed ssh, zsh, vim, etc. You can run following scripts directly.

```bash
6sh scripts/init_a_fresh_ubuntu/{{ 1-10 }}.sh # 1 are required and 2-6 can be install as you want.
```

###### Secondly, you should run following command

```bash
sh ~/.Qdotfiles/scripts/bootstrap.sh # copy "dotfiles" to your home dir "~"
```

###### Third, you should source .zshrc

```bash
source ~/.zshrc
```
