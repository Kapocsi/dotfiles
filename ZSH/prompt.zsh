## Prompt ###  
zi ice src="gitstatus.prompt.zsh"
zi light romkatv/gitstatus



setopt prompt_subst
b='%F{blue}'
fire='$(firejail --list > /dev/null 2>/dev/null || echo "󰒄")'
hostname='%F{196}$([ ! -z $SSH_TTY ] && printf "󰴽 $HOST" ) %f'
git_status='$([ ! -z "${GITSTATUS_PROMPT}" ] && echo "(${GITSTATUS_PROMPT}%39F)%f" )'
current_dir='%1~'
starting_arrow='%F{%(?.046.196)}󰄾%f'
export PROMPT="$fire$hostname%F{39}$current_dir $git_status$starting_arrow %f" 
