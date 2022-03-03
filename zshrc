bindkey -e

export HISTSIZE=10000
export SAVEHIST=10000
export PATH=$HOME/.afx:$PATH

setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt share_history
setopt append_history
setopt inc_append_history
setopt hist_no_store
setopt hist_reduce_blanks

eval "$(afx init)"
eval "$(afx completion zsh)"
