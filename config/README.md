# Installing zsh
```
# https://github.com/sindresorhus/pure#getting-started
npm install --global pure-prompt

ln -s ~/src/dmitry.semenov/config/.zshrc ~/.zshrc
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
```

# Installing tmux & plugins
```

ln -s ~/src/dmitry.semenov/config/.tmux.keys.conf ~/.tmux.keys.conf
ln -s ~/src/dmitry.semenov/config/.tmux.remote.conf ~/.tmux.remote.conf 
ln -s ~/src/dmitry.semenov/config/.tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone git@github.com:dmitry-semenov/kube-tmux.git ~/.tmux/plugins/kube-tmux
~/.tmux/plugins/tpm/bin/install_plugins
```

```
ln -s ~/src/dmitry.semenov/config/.gitignore_global ~/.gitignore_global
git config --global core.excludesFile '~/.gitignore_global'
```



