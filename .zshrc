# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/zz/.zshrc'

zmodload zsh/complist

autoload -Uz compinit promptinit colors
compinit -i
promptinit
colors

zstyle ':completion:*' completer _list _oldlist _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
# zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'l:|=* r:|=*' 'r:|[._-]=** r:|=**' ''
zstyle ':completion:*' max-errors 3
zstyle ':completion:*' menu select
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' substitute 1
# zstyle ':completion:*' use-compctl true
zstyle ':completion:*' matcher-list "m:{a-z}={A-Z}" "l:|=* r:|=*"
# The following lines were added by compinstall
zstyle :compinstall filename "$ZDOTDIR/.zshrc"
# zstyle ':completion:*' file-list all
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'

zle -C alias-expension complete-word _generic
bindkey '^a' alias-expension  # show real command (unaliased)
zstyle ':completion:alias-expension:*' completer _expand_alias

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect '^[h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect '^[k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect '^[j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect '^[l' vi-forward-char
bindkey -M menuselect 'q' send-break
bindkey -M menuselect '^[' send-break
bindkey -M menuselect '$' clear-screen
bindkey -M menuselect $terminfo[kcbt] vi-up-line-or-history # shift+tab
# bindkey -M viins "kj" vi-cmd-mode
bindkey -M viins '^P' up-line-or-history
bindkey -M viins '^N' down-line-or-history

ZLS_COLORS="di=1;46;30"


function _protected_source { # sourcefile
    [[ -f "$1" ]] && source "$1"
}
_protected_source ".functions.zsh"
_protected_source ".aliases.zsh"
_protected_source ".colors.zsh"
_protected_source ".console.zsh"
_protected_source ".keybinds.zsh"
_protected_source ".prompt.zsh"

source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
