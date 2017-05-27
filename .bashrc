#!/bin/bash

###
# bashrc
##

if [ -f /etc/bash.bashrc ]
then
    # debian
    . /etc/bash.bashrc
elif [ -f /etc/bashrc ]
then
    . /etc/bashrc
fi

# fix for tmux true color support
if [ _$TERM == _xterm ] && [ _$COLORTERM == _truecolor ]
then
    export TERM=xterm-256color
fi


###
# Aliases
##

# wttr.in
wttr () {
    curl wttr.in/${1:-kemerovo} | less -R
}

# tmux
tmx() {
    cd ~
    tmux new-session -A -s ${1:-main}
}
alias tmless="tmux capture-pane -S - && tmux save-buffer - | less"

# stuff
alias trm=trash
alias ls="ls --color=auto"
alias assistant="assistant -stylesheet /home/ildar/.local/src/preferences/css/qt_assistant.css"
