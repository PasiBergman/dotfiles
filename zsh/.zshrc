source $HOME/.zshenv
# Completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Autoload colors (for prompt)
autoload -U colors && colors
# Prompt theme
[ -f $HOME/.config/zsh/themes/prompt.zsh ] && source $HOME/.config/zsh/themes/prompt.zsh

# Auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# vi mode
bindkey -v
# export KEYTIMEOUT=1

# vi keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# ------------
# Source files
# ------------

# macOS vs. Linux
if [[ $(uname) == "Darwin" ]]; then
  ZSH_PLUGINS_DIR="$(brew --prefix)/share"
elif [[ $(uname -n) == "lakka" ]]; then
	ZSH_PLUGINS_DIR="$HOME/.local/share"
else
	# i.e. Linux
	ZSH_PLUGINS_DIR="/usr/share/zsh/plugins"
fi

# Syntax highlighting
[ -f "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && \
	source "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
# Autosuggestions
[ -f "$ZSH_PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && \
	source "$ZSH_PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh"

export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

# fnm (node version manager)
[ -d "$HOME/.fnm" ] && export PATH="$HOME/.fnm:$PATH"
[ -d "$HOME/.local/share/fnm" ] && export PATH="$HOME/.local/share/fnm:$PATH"
if (which fnm 1>/dev/null 2>&1); then
  eval "$(fnm env --use-on-cd)"
fi

# Aliases
[ -f "$HOME/.config/zsh/script/alias.sh" ] && \
  source "$HOME/.config/zsh/script/alias.sh"

# Zoxide, if exists
if command -v zoxide &>/dev/null
then
	mkdir -p "$HOME/.cache/zoxide"
	_ZO_DATA_DIR="$HOME/.cache/zoxide"
	_ZO_RESOLVE_SYMLINKS=1
	eval "$(zoxide init zsh)"
fi

# Apply FZF config if it exists
[ -f "${HOME}/.config/fzf/fzf-config.sh" ] && \
  source "${HOME}/.config/fzf/fzf-config.sh"

# Tmux projects
[ -f "$HOME/.config/tmux/aliases.sh" ] && \
  source "$HOME/.config/tmux/aliases.sh"

# Z
[ -f "$HOME/.config/zsh/script/z.sh" ] && \
  source "$HOME/.config/zsh/script/z.sh"
