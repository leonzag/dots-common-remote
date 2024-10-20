#!/usr/bin/zsh

# === Key mapping

# ALT+a, ALT+l to accept completion
bindkey '^[a' autosuggest-accept
bindkey '^[l' autosuggest-accept
# ALT+e to accept and execute
bindkey '^[e' autosuggest-execute
# Shift+H|Shift-L
bindkey -M vicmd 'H' vi-beginning-of-line
bindkey -M vicmd 'L' vi-end-of-line
bindkey -M viins -s '^_' 'ls^M'

# atuin history searcher
bindkey '^r' atuin-search
