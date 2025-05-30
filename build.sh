#! /bin/bash

function verify_history() {
    git log --format="%H" | xargs -P0 -I {} sh -c 'git verify-commit {} 2> /dev/null || (echo "Could not verify {}" && exit 1)'
}

if ! verify_history 
then
    printf "Failed To Verify Commit History.\n" 
    printf "Refusing To Continue. \n\n\n"

    ## Find last trusted commit
    git log --format="%H" \
        | xargs -P0 -I {} sh -c 'git verify-commit {} 2> /dev/null && echo {}' 2>/dev/null \
        | head -n1 \
        | xargs git checkout >/dev/null 2>/dev/null


    printf "Checked out last trusted commit, please verify all changes.\n"\
        "And ensure that there are no malicious changes"

    echo "The Following Files Should be checked:"

    git diff --name-only main

    exit 1
fi



export TMUX_PATH=$(which tmux)
export ALACRITTY_CONF_PATH=./dot-config/alacritty/alacritty.toml

## Check tmux compat 
sort <(echo 3.1; tmux -V | tr -d -c 0-9.) --check 2> /dev/null || echo "Please Update tmux, requires 3.1>="

if [[ "$OSTYPE" == "darwin"* ]]; then 
    export KEYCHAIN_LINE="UseKeychain yes"
    export FONT_SIZE_LINE="size=15"
else 
    export FONT_SIZE_LINE="size=12"
    export KEYCHAIN_LINE="# Removed use keychain for non-mac device\n"
fi 

# We want to use a the option UseKeychain yes on Mac  
envsubst < ./dot-ssh/config.tmpl > ./dot-ssh/config

# Create alacritty config, because tmux does not have constant install location 
# and for some reason I can't get the PATH var to be initialized when tmux is 
# launched 
envsubst < $ALACRITTY_CONF_PATH.tmpl > $ALACRITTY_CONF_PATH

# Decrypt openvpn config
gpg --decrypt-files ~/dotfiles/dot-config/openvpn.tar.gpg
tar -C ~/dotfiles/dot-config/ -xf ~/dotfiles/dot-config/openvpn.tar

if [ ! -f  /usr/local/bin/wait4exit -a $OSTYPE = "darwin\*" ]; then
    echo "Missing Binary File Detected, Installing using :"
    echo "sudo gcc ./packages/wait4exit/wait4exit.c -o /usr/local/bin/wait4exit"

    echo "exec sudo $0 $@"

    echo "$(whoami)"
    [ "$UID" -eq 0 ] || exec sudo "$0" "$@"
    sudo gcc ./packages/wait4exit/wait4exit.c -o /usr/local/bin/wait4exit
fi;

# Run stow in simulation mode, this is just meant to show if there are missing 
# things from the link
MISSING_LINKS=$(
stow -nv --dotfiles .  2>&1  \
    | sed '/WARNING: in simulation mode so not modifying filesystem\./d'  \
    | sort 
)

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
        stow --dotfiles . > /dev/null
        echo "Done!"
    else 
        echo "Proceeding without links..."
    fi

fi
