# Installation

1. Prior to the installation make sure you have committed the following alias to your `.zsh_aliases` or `.bash_aliases`:

  ```zsh
  alias dotfileconf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
  ```

2. Now clone this repo into a bare repository:

  ```zsh
  git clone --bare git@github.com:Llambi/dotfiles.git $HOME/.dotfiles
  ```

3. Checkout the actual content from the bare repository to your $HOME:

  ```zsh
  dotfileconf checkout
  ```

The step above might fail with a message like:

```zsh
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```

This is because your $HOME folder might already have some stock configuration files which would be overwritten by Git. 
The solution is simple: back up the files if you care about them, remove them if you don't care. 
I provide you with a possible rough shortcut to move all the offending files automatically to a backup folder:

```zsh
mkdir -p .dotfiles-backup && \
dotfileconf checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .dotfiles-backup/{}
```

Re-run the check out if you had problems:

```zsh
dofileconf config --local status.showUntrackedFiles no
```
