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
In ```~/``` set the flag showUntrackedFiles to no on this specific (local) repository:
```bash
config config --local status.showUntrackedFiles no
```
## Usage
In ```~/```:

```bash
config status
```

```bash
config pull
```
## Referencies
[The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles)
--
Git Bare Repository - A Better Way To Manage Dotfiles
[![Git Bare Repository - A Better Way To Manage Dotfiles](https://img.youtube.com/vi/tBoLDpTWVOM/0.jpg)](https://www.youtube.com/watch?v=tBoLDpTWVOM)

