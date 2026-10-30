if [[ "$OSTYPE" !=  "linux-gnu" ]]; then
    return
fi


# Mimics the pbcopy/pbpaste of macos
if [[ -n "$WAYLAND_DISPLAY" ]]; then
    alias pbcopy='wl-copy'
    alias pbpaste='wl-paste --no-newline'
else
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
fi

# If we are not in a firejail and the session didn't provide an agent
# (Hyprland exports the systemd ssh-agent socket, which KeePassXC also uses)
if [[ ! -S "$SSH_AUTH_SOCK" ]] && firejail --list 2> /dev/null > /dev/null; then;
    eval $(keychain --eval --quiet)
fi

# pnpm (standalone installer)
export PNPM_HOME="$HOME/.local/share/pnpm"
[[ ":$PATH:" != *":$PNPM_HOME:"* ]] && export PATH="$PNPM_HOME:$PATH"

source /usr/share/doc/git-extras/git-extras-completion.zsh

# xdg-open only takes one target and, outside a full DE (e.g. Hyprland), blocks
# until the app exits, so launch a detached xdg-open per argument
unalias open 2> /dev/null
function open {
    if (( $# == 0 )); then
        print -u2 "usage: open <file|url>..."
        return 1
    fi

    local target ret=0
    for target in "$@"; do
        # Detached launches can't report errors, so catch missing files up front
        if [[ ! -e "$target" && ! "$target" =~ '^[[:alpha:]][[:alnum:]+.-]*:' ]]; then
            print -u2 "open: $target: No such file or directory"
            ret=1
            continue
        fi
        setsid -f xdg-open "$target" &> /dev/null
    done
    return ret
}
