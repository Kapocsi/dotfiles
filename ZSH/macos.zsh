if [[ "$OSTYPE" != "darwin"* ]] then
    return
fi

# m68k-atari-mint cross compiler
export PATH=$PATH:/opt/cross-mint/bin
export MANPATH=$MANPATH:/opt/cross-mint/share/man

export MANPATH="/opt/local/share/man:$MANPATH"

# Add All llvm bins to path, such as clang-{format,tidy,etc.}
path+=("$(brew --prefix llvm)/bin")

alias "chrome"="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias code="open -a Visual Studio Code"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# pnpm comes from Homebrew; PNPM_HOME only holds global installs. Appended (not
# prepended) so a stray shim there can never shadow Homebrew's pnpm/pnpx.
export PNPM_HOME="$HOME/Library/pnpm"
[[ ":$PATH:" != *":$PNPM_HOME:"* ]] && export PATH="$PATH:$PNPM_HOME"

source /opt/homebrew/opt/git-extras/share/git-extras/git-extras-completion.zsh
