# Setup Instructions (Personal Reference)

## Required Packages

Install the necessary packages:

```bash
sudo pacman -S base-devel git go nodejs npm wget unzip ripgrep fd lazygit rustup
```

## Install Neovim

Install Neovim with this command:

```bash
sudo pacman -S neovim
```

## Install Zsh and Configure zinit & powerlevel10k

### Install Zsh

Install Zsh using this command:

```bash
sudo pacman -S zsh
```

### Configure zinit & powerlevel10k

Add the following snippet to your `~/.zshrc` file:

```sh
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit light romkatv/powerlevel10k
```

## Install Tmux and Configure TPM & tmux-powerline

### Install Tmux

Install Tmux with this command:

```bash
sudo pacman -S tmux
```

### Configure TPM (Tmux Plugin Manager)

Clone the TPM repository:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Add the following snippet to the bottom of your `~/.tmux.conf` file (ensure the last `run` command is at the very bottom):

```sh
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# Additional plugins

run '~/.tmux/plugins/tpm/tpm'
```

#### Manage Tmux Plugins

- **Install Plugins:** `prefix + I`
- **Update Plugins:** `prefix + U`
- **Remove Plugins:** `prefix + alt + u`

### Configure tmux-power

Add the following line to your `~/.tmux.conf` file:

```sh
set -g @plugin 'wfxr/tmux-power'
set -g @tmux_power_theme 'moon'
```
