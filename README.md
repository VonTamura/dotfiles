# ConfigFiles Von

This is my config files repo, configurated with git --bare in ```$HOME/dotfiles/```

## Installation
Create directoriy
```bash
mkdir $HOME/dotfiles/
```
Setup alias config in ```.bashrc``` or ```.zshrc``` file. Just change your actual ```$SHELL```
```bash
echo "alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
```
Clone repository
```bash
config clone --bare https://github.com/VonTamura/dotfiles.git $HOME/dotfiles/
```
## Usage
```bash
config pull
```


## Referencies
[a link](https://www.atlassian.com/git/tutorials/dotfiles)

[![Alt text](https://img.youtube.com/vi/tBoLDpTWVOM/0.jpg)](https://www.youtube.com/watch?v=tBoLDpTWVOM)

