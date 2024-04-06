# Create alacritty config, because tmux does not have constant install location 
# and for some reason I can't get the PATH var to be initialized when tmux is 
# launched 
export TMUX_PATH=$(which tmux)
export ALACRITTY_CONF_PATH=./.config/alacritty/alacritty.toml
envsubst < $ALACRITTY_CONF_PATH.template > $ALACRITTY_CONF_PATH

# We want to use a the option UseKeychain yes on Mac  
export KEYCHAIN_LINE=$([[ "$OSTYPE" == "darwin"* ]] && echo "UseKeychain yes" || echo "# Removed use keychain for non-mac device ")
envsubst < ./.ssh/config.tmpl > ./.ssh/config

if [[ ! -f  /usr/local/bin/wait4exit ]]; then
    echo "Missing Binary File Detected, Installing using :"
    echo "sudo gcc ./packages/wait4exit/wait4exit.c -o /usr/local/bin/wait4exit"


    echo "HERE"

    echo "exec sudo $0 $@"
   
    echo "$(whoami)"
    [ "$UID" -eq 0 ] || exec sudo "$0" "$@"
    sudo gcc ./packages/wait4exit/wait4exit.c -o /usr/local/bin/wait4exit
fi;
