# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# SSH
if [ -z "$SSH_AUTH_SOCK" ]; then
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_rsa_reudekx
	ssh-add ~/.ssh/id_ed25519_reudekx
fi

# alias
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -al'

# To customize prompt, run `p10k configure` or edit ~/dotfiles/home/.p10k.zsh.
[[ ! -f ~/dotfiles/home/.p10k.zsh ]] || source ~/dotfiles/home/.p10k.zsh
