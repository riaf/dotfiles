# riaf/dotfiles

## Install

```
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply riaf -b $HOME/.local/bin
```

### For setting up transitory environments

```
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --one-shot riaf -b $HOME/.local/bin
```

## Homebrew

```
brew bundle --file=$XDG_CONFIG_HOME/homebrew/Brewfile
```
