### p10k
# enable powerlevel10k instant prompt. should stay close to the top of ~/.zshrc.
# initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### antigen
export ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
mkdir -p "$ZSH_CACHE_DIR/completions"

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

antigen theme romkatv/powerlevel10k

antigen apply

# to customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

### zsh history settings
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt inc_append_history
setopt share_history
setopt hist_ignore_all_dups

### ssh
if [ -z "$SSH_AUTH_SOCK" ]; then
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_rsa_reudekx
	ssh-add ~/.ssh/id_rsa_rhdehgks
	ssh-add ~/.ssh/id_rsa_aws
fi

### pyenv
# install pyenv
if [ ! -d "$HOME/.pyenv" ]; then
  echo "Notice: pyenv installation directory ($HOME/.pyenv) not found."
  echo "Cloning the latest pyenv from GitHub now. Please wait..."
  git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv
  if [ $? -ne 0 ]; then
    echo "Error: pyenv cloning failed. Check internet connection or git installation."
  fi
fi

# set up shell environment
if [ -d "$HOME/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init - zsh)"
else
  echo "Warning: pyenv directory ($HOME/.pyenv) not found after installation attempt. Skipping pyenv initialization."
fi

### rbenv
# install rbenv
if [ ! -d "$HOME/.rbenv" ]; then
  echo "Notice: rbenv installation directory ($HOME/.rbenv) not found."
  echo "Cloning the latest rbenv from GitHub now. Please wait..."
  git clone https://github.com/rbenv/rbenv.git $HOME/.rbenv
  if [ $? -ne 0 ]; then
    echo "Error: rbenv cloning failed. Check internet connection or git installation."
  fi
fi

# set up shell environment
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init - zsh)"
else
  echo "Warning: rbenv directory ($HOME/.rbenv) not found after installation attempt. Skipping rbenv initialization."
fi

### poetry
# set up shell environment
if [[ -d "$HOME/.local/bin" && ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

### alias
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -al'

### functions
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
