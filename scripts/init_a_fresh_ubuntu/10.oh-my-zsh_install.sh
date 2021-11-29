sudo apt install zsh -y

git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

cp ~/.Qdotfiles/zsh/.zshrc ~/.zshrc

chsh -s /bin/zsh

cd $ZSH_CUSTOM/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

source ~/.zshrc
