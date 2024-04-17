## Initialize Omz ## 
export ZSH="$HOME/dotfiles/packages/ohmyzsh"
export ZSH_CUSTOM="$HOME/dotfiles/ZSH_CUSTOM/"

ZSH_THEME="robbyrussell"

plugins=(git thefuck z pip macos gh python rust brew github zsh-interactive-cd \
    docker  fast-syntax-highlighting  fzf-tab \
    )

## Macos Specifics
if [[ "$OSTYPE" == "darwin"* ]]; then
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
# . "/opt/anaconda3/etc/profile.d/conda.sh"  # commented out by conda initialize
        else
            export PATH="/opt/anaconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<

    # eval "$(/opt/homebrew/bin/brew shellenv)"
    export MANPATH="/opt/local/share/man:$MANPATH"
    
    alias "chrome"="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
    alias python="python3.12"
    alias code="open -a Visual Studio Code"
    # alias wind="pkill Windscribe && open -a Windscribe"
fi

if [[ "$OSTYPE" ==  "linux-gnu" ]]; then 
    # Mimics the pbcopy/pbpaste of macos
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'

    eval $(keychain --eval --quiet id_ed25519)
fi


alias ins_vpn_connect="sudo $HOME/.config/openvpn/vpn_connect.sh"
alias ins_vpn_disconnect="sudo $HOME/.config/openvpn/vpn_disconnect.sh"


 # if [[ -n $SSH_CONNECTION ]]; then
 #   export EDITOR='vim'
 # else
 #   export EDITOR='nvim'
 # fi


 ### Initialize Z and thefuck ### 
 . ~/dotfiles/packages/z/z.sh
source $ZSH/oh-my-zsh.sh
# source $HOME/dotfiles/packages/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(fzf --zsh)"

######## Remaps ###########
alias cat="bat"
alias ls="eza -h -l --icons --git "
# Does more intuitive clearing the way CMD-K would
alias clear="clear && printf \"\e[H\e[2J\e[3J\""
alias tokei="tokei -n commas"
alias g++='g++ -ansi -pedantic-errors -Wall -Wconversion'
alias vim="nvim"


######## Helpers ########
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"

