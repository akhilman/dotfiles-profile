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


###
# aliases
##

. ~/.aliases
