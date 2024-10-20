#!/usr/bin/zsh

# === Terminal Title
# force update window title for terminal (e.g Alacritty)
preexec() { print -Pn "\e]0;$1\a" } # show last command name
# preexec() { print -Pn "\e]0;$1%~\a" } # show last command name + working directory


# === Vi-mode cursor

bindkey -v
function zle-keymap-select() {
    case $KEYMAP$ZLE_STATE in
        # block
        vicmd*) print -n "\e[2 q" ;;
        # bar
        *insert*) print -n "\e[6 q" ;;
        # underbar
        *) print -n "\e[4 q" ;;
    esac
}
zle -N zle-keymap-select

_fix_cursor() { echo -ne '\e[5 q' ; }
precmd_functions+=(_fix_cursor) # Use beam shape cursor on startup.


# === Escape seq color

function escColor() 
{ # COLOR<0-7 or colorname> [normal|bold|italic|underline] TEXT<str>
    case "$1" in
        0|black)   c=0 ;;
        1|red)     c=1 ;;
        2|green)   c=2 ;;
        3|yellow)  c=3 ;;
        4|blue)    c=4 ;;
        5|magenta) c=5 ;;
        6|cyan)    c=6 ;;
        7|white)   c=7 ;;
        *)         c=7 ;;
    esac

    esc="[3$c"

    if [ $# -eq 2 ] ; then
        text=$2

    elif [ $# -eq 3 ] ; then
        text=$3
        case "$2" in
            n|normal)    esc+=";10" ;;
            b|bold)      esc+=";1"  ;;
            i|italic)    esc+=";3"  ;;
            u|underline) esc+=";4"  ;;
        esac
    fi

    echo -e "\e${esc}m${text}\e[0m"
}


# ----------------------------------------------------------------------------
# === LESS : Reading from stdin
# https://wiki.archlinux.org/title/Color_output_in_console#Reading_from_stdin

# usage:
#    $> ptyless program
#    -- To pipe it to other pager (less in this example):
#    $> pty program | less

zmodload zsh/zpty

pty() {
    "Usage:"
        "$ ptyless program"
    "To pipe it to other pager (less in this example):"
        "$ pty program | less"
    zpty pty-${UID} ${1+$@}
    if [[ ! -t 1 ]];then
        setopt local_traps
        trap '' INT
    fi
    zpty -r pty-${UID}
    zpty -d pty-${UID}
}

ptyless() {
    pty $@ | less
}

jamming() {
    packet_size=$1
    target_address=$2
    sudo l2ping -i hci0 -s $packet_size -f $target_address
}
