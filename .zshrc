export ZSH="$HOME/.oh-my-zsh"


ZSH_THEME="robbyrussell"
plugins=(git thefuck z pip macos gh python rust brew github zsh-interactive-cd zsh-syntax-highlighting docker)

source $ZSH/oh-my-zsh.sh

 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi


alias code="open -a Visual Studio Code"



######## Remaps ###########
alias cat="bat"
alias ls="exa -h -l --icons --git"
# Does more intuitive clearing the way CMD-K would
alias clear="clear && printf \"\e[H\e[2J\e[3J\""
alias tokei="tokei -n commas"
alias g++='g++ -ansi -pedantic-errors -Wall -Wconversion -std=c++11'
alias vim="nvim"


######## Helpers ########
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ":q"="exit"

alias wind="echo \"Killing Windscribe\" && ps aux | grep -oE \"thomaskapocsi +([0-9)]).*(\"Windscribe\")\" | grep -oE \"thomaskapocsi +([0-9]+)\" | grep -oE \"([0-9]+)\" | xargs kill -9 || echo \"Starting WindSribe\" && open -a Windscribe"
alias ins_vpn_connect="sudo openvpn ~/.config/openvpn/macovpn-config.ovpn 1> /dev/null &"
alias ins_vpn_disconnect="sudo /Users/thomaskapocsi/.config/openvpn/vpn_disconnect.sh"

. ~/z/z.sh
eval $(thefuck --alias FUCK)

[ -s "/Users/thomaskapocsi/.bun/_bun" ] && source "/Users/thomaskapocsi/.bun/_bun"
