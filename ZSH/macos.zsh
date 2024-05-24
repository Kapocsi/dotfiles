if [[ "$OSTYPE" != "darwin" ]] then 
    return 
fi

export MANPATH="/opt/local/share/man:$MANPATH"

alias "chrome"="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias python="python3.12"
alias code="open -a Visual Studio Code"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
