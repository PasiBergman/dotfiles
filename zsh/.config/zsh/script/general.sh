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
if which nvim &>/dev/null ; 
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
alias historyfzf="history 0 | fzf"
alias fzfhistory="history 0 | fzf"
alias fzfhist="history 0 | fzf"
batfz() {
    bat "$( fd -t file | fzf )"
}

# exa
if command -v exa &>/dev/null
then
  alias ls="exa"
  alias ll="exa --all -al"
  alias la="exa --all -al"
fi

# dotnet
alias dotnetclean="find . -name bin -exec rm -R -f {} \; 2>/dev/null && find . -name obj -exec rm -R -f {} \; 2>/dev/null && dotnet clean 2>/dev/null"

# Lazygit
alias lazygit="lazygit -ucd ${HOME}/.config/lazygit"
alias lg="lazygit -ucd ${HOME}/.config/lazygit"

# Update LunarVim
# alias update-nvim="cd ~/.local/share/lunarvim/lvim && git pull; cd -"
# alias fetch-lvim="cd ~/.local/share/lunarvim/lvim && git fetch upstream && git merge upstream/rolling; cd -"

# fzh
[ -f "${HOME}/.config/zsh/script/fzh.sh" ] && source "${HOME}/.config/zsh/script/fzh.sh"
# fzd
[ -f "${HOME}/.config/zsh/script/fzd.sh" ] && source "${HOME}/.config/zsh/script/fzd.sh"

# Show terminal 256 color map
terminal-colors () {
    for i in {0..255}
    do
        print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}
    done
}

