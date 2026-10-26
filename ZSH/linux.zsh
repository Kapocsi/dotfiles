if [[ "$OSTYPE" !=  "linux-gnu" ]]; then
    return
fi


# Mimics the pbcopy/pbpaste of macos
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# If we are not in a firejail and the session didn't provide an agent
# (Hyprland exports the systemd ssh-agent socket, which KeePassXC also uses)
if [[ ! -S "$SSH_AUTH_SOCK" ]] && firejail --list 2> /dev/null > /dev/null; then;
    eval $(keychain --eval --quiet)
fi

alias open="xdg-open"
