# (de)activate venvs when entering and exiting projects containing them
autoload -Uz add-zsh-hook
add-zsh-hook -Uz chpwd _on_change_pwd
