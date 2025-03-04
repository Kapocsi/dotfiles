if [[ "$OSTYPE" != "darwin"* ]] then
    return
fi

# m68k-atari-mint cross compiler
export PATH=$PATH:/opt/cross-mint/bin
export MANPATH=$MANPATH:/opt/cross-mint/share/man


export MANPATH="/opt/local/share/man:$MANPATH"

alias "chrome"="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias code="open -a Visual Studio Code"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
