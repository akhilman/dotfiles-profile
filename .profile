# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022


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

if [ -d "$HOME/.luarocks/bin" ] ; then
    PATH="$HOME/.luarocks/bin:$PATH"
fi

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PATH


###
# settings for X
##

which qt5ct 2>&1 > /dev/null && export QT_QPA_PLATFORMTHEME=qt5ct


###
# powerline
##

which powerline-daemon > /dev/null 2>&1 \
    && powerline-daemon > /dev/null 2>&1 \
    || true
