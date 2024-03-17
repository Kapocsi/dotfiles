eval "$(/opt/homebrew/bin/brew shellenv)"
alias avg="~/Scripts/avg-rust"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
# Setting PATH for Python 3.10
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
export PATH
eval $(thefuck --alias FUCK)
alias ls="exa -h -l --icons --git"
alias clear="clear && printf \"\e[H\e[2J\e[3J\""
alias adb="~/Scripts/platform-tools/adb"
alias md="python3 ~/Projects/docs/auto_markdown.py"
alias nvid="neovide"
alias idea="open -a \"IntelliJ IDEA.app\" --args \"$@\""
alias tokei="tokei -n commas"
alias cat="bat"
alias ":q"="exit"
. ~/.z.sh

##
# Your previous /Users/thomaskapocsi/.zprofile file was backed up as /Users/thomaskapocsi/.zprofile.macports-saved_2023-01-26_at_14:54:44
##

# MacPorts Installer addition on 2023-01-26_at_14:54:44: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.
# MacPorts Installer addition on 2023-01-26_at_14:54:44: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH="/opt/local/share/man:$MANPATH"
# Finished adapting your MANPATH environment variable for use with MacPorts.


alias python="python3.12"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"


alias g++='g++ -ansi -pedantic-errors -Wall -Wconversion -std=c++11'
