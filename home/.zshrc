export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

if [ -z "$SSH_AUTH_SOCK" ]; then
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_rsa_reudekx
	ssh-add ~/.ssh/id_ed25519_reudekx
fi

prompt_context() {
	# if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
	# 	prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
	# fi

	prompt_segment black default $(date +"%H:%M:%S")
}

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
