#!/bin/bash
stty -ixon

case "$TERM" in
	dumb)
		PS1="(dumb) \w > "
		;;
	*)
		RED="\[$(tput setaf 1)\]"
		GREEN="\[$(tput setaf 2)\]"
		BLUE="\[$(tput setaf 4)\]"
		RESET="\[$(tput sgr0)\]"
		PS1="${RESET}[\$([[ \$? == 0 ]] && echo -n \"${GREEN}\$?\" || echo -n \"${RED}\$?\")${RESET}] ${BLUE}\w${RESET} "
		# [ "$TERM" = "screen-256color" ] && PS1="(screen) $PS1"
		[ "$TERM" = "dvtm-256color" ] && PS1="(dvtm) $PS1"
		[ -n "$RANGER_LEVEL" ] && PS1="$PS1"'(ranger) '
		unset RESET GREEN BLUE RED
esac

shopt -s autocd
shopt -s cdspell
shopt -s cmdhist
shopt -s dirspell
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s globstar
shopt -s histappend
shopt -s no_empty_cmd_completion
shopt -s nocaseglob
shopt -s progcomp_alias

[ -f ~/.dir_colors ] && eval "$(dircolors -b ~/.dir_colors)"

. ~/.config/aliases

HISTSIZE=
HISTFILESIZE=
HISTCONTROL='ignorespace:erasedups'

# less gz files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

[ -f /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

. /usr/share/doc/fzf/examples/key-bindings.bash
