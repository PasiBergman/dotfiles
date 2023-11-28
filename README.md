# dotfiles

Collection of many of my macOS/Linux configuration files.

Installation utilizes GNU Stow.

## dotfiles installation

- Make sure, that GNU Stow is installed, e.g. on macOS use

```shell
brew install stow
```

- Choose a folder name for your dotfiles and store the name to a variable.
  Store also the URL of the dotfiles repository

```shell
DOTFILES_DIR="~/.dotfiles"

# Using SSH
REPO_URL="git@github.com:PasiBergman/dotfiles.git"
# Using HTTPS
# REPO_URL="https://github.com/PasiBergman/dotfiles.git"

git clone $REPO_URL $DOTFILES_DIR
```
