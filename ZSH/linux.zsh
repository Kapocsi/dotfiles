if [[ "$OSTYPE" !=  "linux-gnu" ]]; then 
    return 
fi

# As per https://github.com/keybase/keybase-issues/issues/2798
export GPG_TTY=$(tty)

# Mimics the pbcopy/pbpaste of macos
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# If we are not in a firejail 
if firejail --list 2> /dev/null > /dev/null; then;
    eval $(keychain --agents ssh --eval --quiet)
fi

alias open="xdg-open"
