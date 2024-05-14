export TMUX_PATH=$(which tmux)
export ALACRITTY_CONF_PATH=./.config/alacritty/alacritty.toml


if [[ "$OSTYPE" == "darwin"* ]]; then 
    export KEYCHAIN_LINE="UseKeychain yes"
    export FONT_SIZE_LINE="size=15"
else 
    
    export KEYCHAIN_LINE="# Removed use keychain for non-mac device\n"
fi 

# We want to use a the option UseKeychain yes on Mac  
envsubst < ./.ssh/config.tmpl > ./.ssh/config

# Create alacritty config, because tmux does not have constant install location 
# and for some reason I can't get the PATH var to be initialized when tmux is 
# launched 
envsubst < $ALACRITTY_CONF_PATH.template > $ALACRITTY_CONF_PATH

if [ ! -f  /usr/local/bin/wait4exit -a $OSTYPE = "darwin"* ]; then
    echo "Missing Binary File Detected, Installing using :"
    echo "sudo gcc ./packages/wait4exit/wait4exit.c -o /usr/local/bin/wait4exit"

    echo "exec sudo $0 $@"
   
    echo "$(whoami)"
    [ "$UID" -eq 0 ] || exec sudo "$0" "$@"
    sudo gcc ./packages/wait4exit/wait4exit.c -o /usr/local/bin/wait4exit
fi;

# Run stow in simulation mode, this is just meant to show if there are missing 
# things from the link
MISSING_LINKS=$(stow -nv .  2>&1 | sed '/WARNING: in simulation mode so not modifying filesystem\./d')
if (test $(echo $MISSING_LINKS | wc -c) -ne 1 )  

then
    echo "The Following Symlinks were not found:"

    IFS=$'\n'
    for l in $MISSING_LINKS 
    do 
        printf "\t$l\n"
    done

    read -p "Do you want me to add them for you? " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        stow . 
    fi

    echo "Done!"
fi
