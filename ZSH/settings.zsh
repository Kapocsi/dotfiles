# History
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Complete partial names ie "bar" can match "foobar"
zstyle ':completion:*' matcher-list 'r:|?=**'

bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# Allow for cloneing using the `t` command 
export T_REPOS_DIR="~/repos"
