#!/bin/sh

CURRENT_DIR=$(cd "$(dirname "$0")"; pwd)

if [ "$(uname)" == 'Darwin' ]; then
  DIST='darwin-amd64'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  DIST='linux-amd64'
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi

mkdir -pv \
  $CURRENT_DIR/.local/bin \
  $CURRENT_DIR/.local/share \
  $CURRENT_DIR/.local/share/vim/{undo,swap,backup,viminfo} \
  $CURRENT_DIR/.local/share/nvim/{undo,swap,backup,viminfo} \
  $CURRENT_DIR/.config/tmux/plugins \
  $CURRENT_DIR/.local/share/vim/repos/github.com/Shougo

ln -nsfv \
  $CURRENT_DIR/.zshenv \
  $CURRENT_DIR/.gitignore \
  $CURRENT_DIR/.gitconfig \
  $CURRENT_DIR/.local \
  $CURRENT_DIR/.config \
  $HOME

if [ ! -d $CURRENT_DIR/.config/tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm \
    $CURRENT_DIR/.config/tmux/plugins/tpm
fi

if [ ! -d $HOME/.zplug ]; then
  curl -sL --proto-redir -all,https \
    https://raw.githubusercontent.com/zplug/installer/master/installer.zsh \
    | zsh
fi

if [ ! -d $CURRENT_DIR/.local/share/vim/repos/github.com/Shougo/dein.vim ]; then
  git clone \
    https://github.com/Shougo/dein.vim \
    $CURRENT_DIR/.local/share/vim/repos/github.com/Shougo/dein.vim
fi

if [ ! -e $CURRENT_DIR/.local/bin/direnv ]; then
  curl -sL -o $CURRENT_DIR/.local/bin/direnv \
    `curl --silent https://api.github.com/repos/direnv/direnv/releases/latest | /usr/bin/awk '/browser_download_url/ { print $2 }' | /usr/bin/grep $DIST | /usr/bin/sed 's/"//g'`
  chmod +x $CURRENT_DIR/.local/bin/direnv
fi
