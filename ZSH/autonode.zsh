autoload -Uz update_node_path
autoload -Uz add-zsh-hook

# run once on shell start, then on every cd
add-zsh-hook chpwd update_node_path
update_node_path
