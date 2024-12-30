# =====================
# Functions
# =====================

b64() {
    echo "$1 base64 encoded:"
    echo -n "$1" | base64
}
b64d() {
    echo "$1 decoded from base64:"
    echo -n "$1" | base64 -D
}

sha256() {
    /usr/bin/shasum -a 256 "$1"
}

# =====================
# Aliases
# =====================

# Reverse aliases. Open these filetypes with nvim
if command -v nvim &>/dev/null
then
  alias -s {cs,ts,js,vue,html,htm,md,json,yml,yaml,txt,sh}="nvim"

  # Nvim
  alias vim="nvim"
  alias vi="nvim"
  # alias n="nvim"
fi

# Hardware
alias cpu-info="${HOME}/.config/zsh/script/cpu-info.sh"
alias mem=$'ps axc -o cmd,%mem --sort=-%mem | head -n 15 | awk \'{printf("%-20s %5s%\\n", $1, $2)}\''
alias cpu=$'ps axc -o cmd,%cpu --sort=-%cpu | head -n 15 | awk \'{printf("%-20s %5s%\\n", $1, $2)}\''

# Utils
alias sää='curl -s "https://wttr.in/Kukkumäki,Espoo?MF1&lang=fi"'

# LunarVim
# alias l=lvim

# Fzf
if command -v fzf &>/dev/null
then
  alias historyfzf="history 0 | fzf"
  alias fzfhistory="history 0 | fzf"
  alias fzfhist="history 0 | fzf"
  batfz() {
      bat "$( fd -t file | fzf )"
  }
  # fzh
  [ -f "${HOME}/.config/zsh/script/fzh.sh" ] && source "${HOME}/.config/zsh/script/fzh.sh"
  # fzd
  [ -f "${HOME}/.config/zsh/script/fzd.sh" ] && source "${HOME}/.config/zsh/script/fzd.sh"
fi

# eza
if command -v eza &>/dev/null
then
  alias ls="eza --icons --group-directories-first"
  alias ll="eza --icons --group-directories-first -l"
  alias la="eza --icons --group-directories-first -l --all"
fi

# dotnet
alias dotnetclean="find . -name bin -exec rm -R -f {} \; 2>/dev/null && find . -name obj -exec rm -R -f {} \; 2>/dev/null && dotnet clean 2>/dev/null"

# Lazygit
if command -v lazygit &>/dev/null
then
  alias lazygit="lazygit -ucd ${HOME}/.config/lazygit"
  alias lg="lazygit -ucd ${HOME}/.config/lazygit"
fi

# Show terminal 256 color map
terminal-colors () {
    for i in {0..255}
    do
        print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}
    done
}

