autoload -Uz run-help
autoload -Uz add-zsh-hook
autoload -Uz colors && colors
autoload -Uz compinit && compinit -u
autoload -Uz is-at-least

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000

if [[ $UID == 0 ]]; then
    unset HISTFILE
    export SAVEHIST=0
fi

export EDITOR=vim
export PATH="$HOME/bin:$PATH"
