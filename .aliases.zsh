#!/usr/bin/zsh

#colored
alias diff="diff --color=auto"

alias grep="grep --color=auto"
[[ -f /usr/bin/rg ]] && alias grep="rg --color=auto"

alias ip="ip -color=auto"
alias dmesg="sudo dmesg --color=always | less"

[[ -f /usr/bin/bat ]] && alias ccat='/usr/bin/cat' && alias cat='bat'
[[ -f /usr/bin/batcat ]] && alias ccat='/usr/bin/cat' && alias bat='batcat' && alias cat='batcat'
[[ -f /usr/bin/neofetch ]] && alias nf='neofetch'

# alias mkdir="mkdir -p"
# [[ $TERM == "xterm-kitty" ]] && alias ssh="kitty +kitten ssh"
alias kssh="kitty +kitten ssh"
alias t="touch"
alias x="chmod +x"
alias cls="clear"
alias q="exit"
[[ -f /usr/bin/lsd ]] && alias ls="lsd"
alias l="ls"
alias la="ls -a"
alias ll="ls -lA"
alias cp="cp -r --reflink=auto"
alias tree='tree -a -I .git --dirsfirst'
alias utc='env TZ=UTC date'
alias date-iso='date +"%Y-%m-%dT%H:%M:%S%z"'
alias pyvenv="python -m venv .venv"
alias pysource="source .venv/bin/activate"
alias pysrc=pysource
alias mtrg='mtr 8.8.8.8'
alias mtrc='mtr 1.1.1.1'

tmpd() { cd "$(mktemp -d -t "${1:-tmp}.XXXXXXXXXX")" }

[[ -f /usr/bin/ranger ]] && alias r="ranger"
alias sudo="sudo " # Make aliases work with sudo
alias vim="${EDITOR}"
alias v="vim"
alias please="sudo"
alias plz="please"
alias sudovim="sudoedit"
alias sudov="sudovim"
alias sv="sudov"

function md()
{ # Creates multiple dirs, or if one is specified: creates it and enter inside
    GC="\033[32;1m"  # green (good)
    EC="\033[31;1m"  # red (error)
    IC="\033[3m"     # italic (info)
    NC="\033[0m"     # normal

    if [[ "$#" == 1 ]]; then
        mkdir -p -- "$1" &&
            cd -- "$1" &&
            echo -e "$GC➔ 📁$NC${IC}${1}${NC}"

    else
        for entry in "$@"; do
            mkdir -p -- "$entry" &&
                echo -e "$GC✛ 📁$NC${IC}$entry${NC}" ||
                return 1
        done
    fi
}
compdef _directories md
