# shellcheck shell=bash
# Sunset Orange colours for less and man pages. Part of talb-dotfiles.
# Sourced from ~/.config/bash/bashrc.

# Make sure less passes colour escapes through.
case " ${LESS:-} " in
  *R*) ;;
  *) export LESS="${LESS:+$LESS }-R" ;;
esac

export LESS_TERMCAP_md=$'\e[1;38;5;208m'               # bold      -> headings, orange
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_us=$'\e[4;38;5;220m'                 # underline -> arguments, gold
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;38;5;234;48;5;214m'      # standout  -> prompt and search hits
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_mb=$'\e[1;38;5;196m'                  # blink     -> red
export LESS_TERMCAP_mr=$'\e[7m'
export LESS_TERMCAP_mh=$'\e[2m'

# groff >= 1.23 emits SGR codes that bypass LESS_TERMCAP; use the classic overstrike output.
export GROFF_NO_SGR=1
export MANROFFOPT="-c"
