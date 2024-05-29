ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi


source "${ZINIT_HOME}/zinit.zsh"

autoload -U compinit && compinit
zinit ice atload"zpcdreplay" atclone"./zplug.zsh" atpull"%atclone"
zinit light g-plane/pnpm-shell-completion

for s in \
    OMZL::{functions.zsh,clipboard.zsh,termsupport.zsh} \
    OMZP::{git,pip,python,github,thefuck,brew}
    ;
do
    zi snippet "$s"
done


for p in \
    zsh-users/zsh-syntax-highlighting \
    Aloxaf/fzf-tab \
    zsh-users/zsh-completions \
    jeffreytse/zsh-vi-mode \
    g-plane/pnpm-shell-completion \
    hsaunders1904/pyautoenv
    ;
do
    zinit light "$p"
done

for p in \
    gh\
    docker 
    ;
do
    zi ice as"completion"
    zi snippet OMZP::$p
done


# Initialize fzf integration after the start of the vim-mode plugin, without 
# this most of the fzf func only works in "normal" mode
export function zvm_after_init() {
    eval "$(fzf --zsh)"
}

eval "$(zoxide init zsh)"

autoload -Uz manydots-magic
manydots-magic
