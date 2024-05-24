if [[ "$OSTYPE" !=  "linux-gnu" ]]; then 
    return 
fi
# Mimics the pbcopy/pbpaste of macos
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

eval $(keychain --eval --quiet id_ed25519)

alias open="xdg-open"
