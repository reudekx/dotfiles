# ====================================================================
# functions
# ====================================================================
clip() {
    if [ -z "$1" ]; then
        echo "Error: Please provide a filename as an argument." >&2
        return 1
    elif [ ! -f "$1" ]; then
        echo "Error: File '$1' not found or is not a regular file." >&2
        return 1
    fi
    iconv -f utf8 -t utf16le "$1" | clip.exe && echo "File '$1' successfully copied to clipboard."
}


# ====================================================================
# p10k instant prompt
# ====================================================================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# ====================================================================
# antigen
# ====================================================================
export ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
mkdir -p "$ZSH_CACHE_DIR/completions"

export ANTIGEN_LOG="$HOME/.antigen.log"

ANTIGEN_HOME="$HOME/.antigen"
[ ! -d "$ANTIGEN_HOME/.git" ] && mkdir -p "$(dirname "$ANTIGEN_HOME")" && git clone --depth=1 https://github.com/zsh-users/antigen.git "$ANTIGEN_HOME"
source "${ANTIGEN_HOME}/antigen.zsh"

antigen use oh-my-zsh

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zdharma-continuum/fast-syntax-highlighting
antigen bundle git
antigen bundle docker
antigen bundle sudo
antigen bundle colored-man-pages
antigen bundle terraform
antigen bundle BreakingPitt/zsh-packer@main

antigen theme romkatv/powerlevel10k

antigen apply


# ====================================================================
# p10k
# ====================================================================
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# ====================================================================
# zsh history settings
# ====================================================================
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt inc_append_history
setopt share_history
setopt hist_ignore_all_dups


# ====================================================================
# ssh
# ====================================================================
[ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)"


# ====================================================================
# pyenv
# ====================================================================
command -v pyenv >/dev/null && eval "$(pyenv init - zsh)"


# ====================================================================
# rbenv
# ====================================================================
command -v rbenv >/dev/null && eval "$(rbenv init - zsh)"


# ====================================================================
# poetry
# ====================================================================
[[ -d "$HOME/.local/bin" && ":$PATH:" != *":$HOME/.local/bin:"* ]] && export PATH="$HOME/.local/bin:$PATH"


# ====================================================================
# alias
# ====================================================================
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -al'
