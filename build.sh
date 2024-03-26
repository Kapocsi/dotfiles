TMUX=$(which tmux) envsubst < ./.config/alacritty/alacritty.toml.template > ./.config/alacritty/alacritty.toml

KEYCHAIN_LINE=$(if [[ "$OSTYPE" == "darwin"* ]]; then echo "UseKeychain yes"; else echo "# Removed use keychain for non-mac "; fi)\
    envsubst < ./.ssh/config.tmpl > ./.ssh/config

