## Initialize Omz ## 
export ZSH="$HOME/dotfiles/packages/ohmyzsh"
ZSH_THEME="robbyrussell"

plugins=(git thefuck z pip macos gh python rust brew github zsh-interactive-cd docker)

path+=("$HOME/.oh-my-zsh")
path+=("$HOME/.cargo/bin")
path+=("$HOME/.bun")
path+=("$BUN_INSTALL/bin")

## Macos Specifics
if [[ "$OSTYPE" == "darwin"* ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
   
    export MANPATH="/opt/local/share/man:$MANPATH"
    
    path+=("/opt/local/bin:/opt/local/sbin")
    
    alias python="python3.12"
    alias code="open -a Visual Studio Code"


    path+=("/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome")
    path+=("/Library/Frameworks/Python.framework/Versions/3.10/bin")
    path+=("/opt/homebrew/opt/mysql-client/bin")
    path+=("/opt/homebrew/opt/postgresql@15/bin")


    alias wind="echo \"Killing Windscribe\" && ps aux | grep -oE \"thomaskapocsi +([0-9)]).*(\"Windscribe\")\" | grep -oE \"thomaskapocsi +([0-9]+)\" | grep -oE \"([0-9]+)\" | xargs kill -9 || echo \"Starting WindSribe\" && open -a Windscribe"
fi

if [[ "$OSTYPE" ==  "linux-gnu" ]]; then 
    # Mimics the pbcopy/pbpaste of macos
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'

fi


alias ins_vpn_connect="sudo openvpn $HOME/openvpn/macovpn-config.ovpn 1> /dev/null &"
alias ins_vpn_disconnect="sudo $HOME/.config/openvpn/vpn_disconnect.sh"


 # if [[ -n $SSH_CONNECTION ]]; then
 #   export EDITOR='vim'
 # else
 #   export EDITOR='nvim'
 # fi


 ### Initialize Z and thefuck ### 
 . ~/dotfiles/packages/z/z.sh
source $ZSH/oh-my-zsh.sh
source $HOME/dotfiles/packages/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

######## Remaps ###########
alias cat="bat"
alias ls="exa -h -l --icons --git"
# Does more intuitive clearing the way CMD-K would
alias clear="clear && printf \"\e[H\e[2J\e[3J\""
alias tokei="tokei -n commas"
alias g++='g++ -ansi -pedantic-errors -Wall -Wconversion'
alias vim="nvim"


######## Helpers ########
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
