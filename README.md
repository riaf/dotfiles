# riaf/dotfiles

## Install

```
# For the first time
sudo xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply riaf
```

## Homebrew

```
brew bundle --file=$XDG_CONFIG_HOME/homebrew/Brewfile
```
