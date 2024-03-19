path+=("$HOME/.oh-my-zsh")
path+=("/$HOME/.cargo/bin")
path+=("$HOME/.bun")
path+=("$BUN_INSTALL/bin")


if [[ "$OSTYPE" == "darwin"* ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"

    export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
    export MANPATH="/opt/local/share/man:$MANPATH"

    alias python="python3.12"
    path+=("/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome")
    path+=("/opt/homebrew/opt/mysql-client/bin")
    path+=("/opt/homebrew/opt/postgresql@15/bin")
    path+=("/Library/Frameworks/Python.framework/Versions/3.10/bin")
fi





