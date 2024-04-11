. "$HOME/.cargo/env"

path+=("$HOME/.oh-my-zsh")
path+=("$HOME/.cargo/bin")
path+=("$HOME/.bun")
path+=("$BUN_INSTALL/bin")

if [[ "$OSTYPE" == "darwin"* ]]; then
    path+=("/Library/Frameworks/Python.framework/Versions/3.10/bin")
    path+=("/opt/homebrew/opt/mysql-client/bin")
    path+=("/opt/homebrew/opt/postgresql@15/bin")
    path+=("/opt/local/bin")
    path+=("/opt/local/sbin")

    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
