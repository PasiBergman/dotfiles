# Add locally installed fzf to path - if found
[ -d "$HOME/.fzf/bin" ] && export PATH="$HOME/.fzf/bin:$PATH"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
