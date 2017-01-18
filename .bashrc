#!/bin/bash

###
# aliases
##

. ~/.aliases


###
# prompt
##

# if [ -f `which powerline-daemon`  ]; then
#     powerline-daemon -q
#     POWERLINE_BASH_CONTINUATION=1
#     POWERLINE_BASH_SELECT=1
#     . /usr/share/powerline/bash/powerline.sh
# fi


if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    PS1='\[\033[01;32m\]<\u@\h>\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '
else
    PS1='<\u@\h>:\w\n\$ '
fi


if [[ "$TERM" =~ screen.* ]]
then
    PS1='\ek\W\e\\'$PS1
elif [[ "$TERM" =~ xterm.* ]]
then
    PS1='\e]0;\u@\h: \w\a'$PS1
fi
