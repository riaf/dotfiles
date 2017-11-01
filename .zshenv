setopt no_global_rcs

export ZDOTDIR=$HOME/.config/zsh

typeset -gx -U path
path=( \
    /usr/local/sbin(N-/) \
    /usr/local/bin(N-/) \
    ~/.local/bin(N-/) \
    ~/bin(N-/) \
    ~/.zplug/bin(N-/) \
    ~/.tmux/bin(N-/) \
    "$path[@]" \
    )

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export VIMINIT=":source $XDG_CONFIG_HOME"/nvim/init.vim
