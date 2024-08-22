ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi


source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz compinit && compinit
autoload bashcompinit && bashcompinit

zinit ice atload"zpcdreplay" atclone"./zplug.zsh" atpull"%atclone"
zinit light g-plane/pnpm-shell-completion



for p in \
    Aloxaf/fzf-tab \
    jeffreytse/zsh-vi-mode \
    z-shell/F-Sy-H \
    ;
do
    zinit light "$p"
done



# Initialize fzf integration after the start of the vim-mode plugin, without 
# this most of the fzf func only works in "normal" mode
export function zvm_after_init() {
    eval "$(fzf --zsh)"
}

eval "$(zoxide init zsh)"

autoload -Uz manydots-magic
manydots-magic

complete -C $(which aws_completer) aws
