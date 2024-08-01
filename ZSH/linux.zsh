if [[ "$OSTYPE" !=  "linux-gnu" ]]; then 
    return 
fi
# Mimics the pbcopy/pbpaste of macos
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# If we are not in a firejail 
if firejail --list 2> /dev/null > /dev/null; then;
    eval $(keychain --agents ssh --eval --quiet)
fi

export BROWSER=$(which brave)


alias open="xdg-open"
