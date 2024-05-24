## Prompt ###  
zi ice src="gitstatus.prompt.zsh"
zi light romkatv/gitstatus



setopt prompt_subst
b='%F{blue}'
hostname='%F{39}$([ ! -z $SSH_TTY ] && printf "󰴽 $HOST" ) %f'
git_status='$([ ! -z "${GITSTATUS_PROMPT}" ] && echo "(${GITSTATUS_PROMPT}%39F)%f" )'
current_dir='%1~'
starting_arrow='%F{%(?.046.196)}󰄾%f'
export PROMPT="$hostname%F{39}$current_dir $git_status$starting_arrow %f" 
