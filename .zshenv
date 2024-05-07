. "$HOME/.cargo/env"

path+=("$HOME/.oh-my-zsh")
path+=("$HOME/.cargo/bin")
path+=("$HOME/.bun")
path+=("$BUN_INSTALL/bin")

if [[ "$OSTYPE" == "darwin"* ]]; then
    # We want to use the brew installation rather than whatever macos is doing
    alias python3="python"

    path+=("/Library/Frameworks/Python.framework/Versions/3.10/bin")
    path+=("/opt/homebrew/opt/mysql-client/bin")
    path+=("/opt/homebrew/opt/postgresql@15/bin")
    path+=("/opt/local/bin")
    path+=("/opt/local/sbin")

    eval "$(/opt/homebrew/bin/brew shellenv)"
fi



if (which nvim > /dev/null); then 
    export EDITOR="nvim"
else
    export EDITOR="VIM"
fi
