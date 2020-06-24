# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

export PROFILE_LOADED=true

###
# stuff
##

if which nvim 2>&1 > /dev/null
then
    export EDITOR=nvim
else
    export EDITOR=vim
fi


###
# rc files from .local/opt applications
##

if [ -d $HOME/.local/opt/profile.d ]
then
    for f in $(find $HOME/.local/opt/profile.d/ -type f)
    do
        [ -x $f ] && . $f
    done
    unset f
fi


###
# set PATH so it includes user's private bin if it exists
##

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi


###
# tools
##

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ] ; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -d "$HOME/.luarocks/bin" ] ; then
    PATH="$HOME/.luarocks/bin:$PATH"
fi

if [ -d "$HOME/.yarn/bin" ] ; then
    PATH="$HOME/.yarn/bin:$PATH"
fi

export GOPATH=$HOME/.go
if [ -d "$GOPATH/bin" ] ; then
    PATH="$GOPATH/bin/:$PATH"
fi

export PATH


###
# powerline
##

which powerline-daemon > /dev/null 2>&1 \
    && powerline-daemon > /dev/null 2>&1 \
    || true


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
