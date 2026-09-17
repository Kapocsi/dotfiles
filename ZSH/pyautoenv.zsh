# (de)activate venvs when entering and exiting projects containing them
autoload -Uz _on_change_pwd
autoload -Uz add-zsh-hook

# run once on shell start, then on every cd
add-zsh-hook -Uz chpwd _on_change_pwd
_on_change_pwd
