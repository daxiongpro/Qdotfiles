# sudo apt install zsh -y

git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# cp ~/.Qdotfiles/zsh/.zshrc ~/.zshrc

chsh -s /usr/bin/zsh
exec zsh

# cd $ZSH_CUSTOM/plugins
cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

source ~/.zshrc

echo "please reboot"
