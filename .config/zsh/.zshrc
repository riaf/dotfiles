# [start zplug]
if [[ -f ~/.zplug/init.zsh ]]; then
  source ~/.zplug/init.zsh

  zplug "zplug/zplug", hook-build:'zplug --self-manage'

  zplug "mollifier/anyframe"
  zplug "mollifier/cd-gitroot"

  zplug "zsh-users/zsh-syntax-highlighting", defer:2
  zplug "zsh-users/zsh-completions"

  zplug "glidenote/hub-zsh-completion"
  zplug 'Valodim/zsh-curl-completion'

  zplug "b4b4r07/enhancd", use:init.sh
  if zplug check "b4b4r07/enhancd"; then
      export ENHANCD_FILTER="fzf --height 50% --reverse --ansi"
      export ENHANCD_DOT_SHOW_FULLPATH=1
  fi

  zplug "b4b4r07/ssh-keyreg", as:command, use:bin

  zplug "stedolan/jq", \
      as:command, \
      from:gh-r, \
      rename-to:jq

  zplug "junegunn/fzf-bin", \
      as:command, \
      from:gh-r, \
      rename-to:"fzf", \
      frozen:1

  zplug "monochromegane/the_platinum_searcher", \
      as:command, \
      from:gh-r, \
      rename-to:"pt", \
      frozen:1

  zplug "peco/peco", \
      as:command, \
      from:gh-r, \
      frozen:1

  zplug "motemen/ghq", \
      as:command, \
      from:gh-r, \
      rename-to:ghq

  zplug 'dracula/zsh', as:theme

  if ! zplug check --verbose; then
      printf "Install? [y/N]: "
      if read -q; then
          echo; zplug install
      fi
  fi

  zplug load
fi
# [end zplug]

# [start alias]
alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf"
[ ${+commands[nvim]} -eq 1 ] && alias vim='nvim'
# [end alias]

# [start suffix alias]
function extract() {
  case $1 in
    *.tar.gz|*.tgz) tar xzvf $1;;
    *.tar.xz) tar Jxvf $1;;
    *.zip) unzip $1;;
    *.lzh) lha e $1;;
    *.tar.bz2|*.tbz) tar xjvf $1;;
    *.tar.Z) tar zxvf $1;;
    *.gz) gzip -d $1;;
    *.bz2) bzip2 -dc $1;;
    *.Z) uncompress $1;;
    *.tar) tar xvf $1;;
    *.arj) unarj $1;;
  esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract
# [end suffix alias]

# [start keybind]
bindkey -e
bindkey "^?" backward-delete-char

bindkey '^b' anyframe-widget-cdr
bindkey '^x^b' anyframe-widget-checkout-git-branch

bindkey '^xr' anyframe-widget-execute-history
bindkey '^x^r' anyframe-widget-execute-history

bindkey '^r' anyframe-widget-put-history
bindkey '^x^i' anyframe-widget-put-history

bindkey '^g' anyframe-widget-cd-ghq-repository
bindkey '^x^g' anyframe-widget-cd-ghq-repository

bindkey '^xk' anyframe-widget-kill
bindkey '^x^k' anyframe-widget-kill

bindkey '^xe' anyframe-widget-insert-git-branch
bindkey '^x^e' anyframe-widget-insert-git-branch
# [end keybind]

# [start cd/ls]
setopt auto_cd
setopt auto_pushd
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
setopt list_packed
setopt nolistbeep
function chpwd() { ls }
# [end cd/ls]

# [start color]
autoload -Uz colors
colors
export CLICOLOR=1;
setopt prompt_subst
# [end color]

# [start completion]
autoload -Uz compinit
compinit -C
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# [end completion]

# [start history]
autoload -U history-search-end

HISTFILE=~/.cache/zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

setopt hist_ignore_dups
setopt share_history
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt EXTENDED_HISTORY

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
# [end history]

# [start prompt]
if autoload +X vcs_info 2> /dev/null; then
    autoload -Uz vcs_info
    zstyle ':vcs_info:*' formats '%s:%b'
    zstyle ':vcs_info:*' actionformats '%s:%b (%a)'
    precmd_vcs_info() {
        psvar[1]=""
        LANG=en_US.UTF-8 vcs_info
        [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
    }
    precmd_functions+=precmd_vcs_info
    RPROMPT="${RPROMPT}%1(V. %F{green}%1v%f.)"
fi

PROMPT='
%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)
'

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""
# [end prompt]

setopt correct
setopt extended_glob

REPORTTIME=15

[ ${+commands[direnv]} -eq 1 ] && eval "$(direnv hook zsh)"

# [start zshlocal]
if [[ -f ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi
# [end zshlocal]
