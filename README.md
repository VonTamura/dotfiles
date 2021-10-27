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
git clone --bare https://github.com/VonTamura/dotfiles.git $HOME/dotfiles/
```
## Usage
```bash
config pull
```


## Referencies

https://www.atlassian.com/git/tutorials/dotfiles

<iframe width="560" height="315" src="https://www.youtube.com/embed/tBoLDpTWVOM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
