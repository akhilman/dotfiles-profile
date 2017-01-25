#!/bin/bash

###
# aliases
##

. ~/.aliases


###
# prompt
##

PS1='\[\e[0;32m\]\u@\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'


if [[ "$TERM" =~ screen.* ]]
then
    PS1='\ek\W\e\\'$PS1
elif [[ "$TERM" =~ xterm.* ]]
then
    PS1='\e]0;\u@\h: \w\a'$PS1
fi
