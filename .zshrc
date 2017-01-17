#zshrc

###
# Aliases
##

. ~/.aliases


###
# ZSH configuration
##

fpath=(~/.zsh/site-functions $fpath)
#
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ildar/.zshrc'

# LS_COLORS=$(dircolors -b)
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
unsetopt LIST_BEEP
compinit

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
setopt histignorespace # do not push command to history if starts with space
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

bindkey -e
# End of lines configured by zsh-newuser-install

# options
setopt autocd
setopt CORRECT_ALL
setopt EXTENDED_GLOB


if [ -f /usr/share/powerline/zsh/powerline.zsh ]
then
    . /usr/share/powerline/zsh/powerline.zsh
else
    # VCS info
    setopt prompt_subst
    autoload -Uz vcs_info
    autoload -Uz colors
    zstyle ':vcs_info:*' actionformats \
        '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
    zstyle ':vcs_info:*' formats       \
        '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
    zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

    zstyle ':vcs_info:*' enable git cvs svn

    # or use pre_cmd, see man zshcontrib
    vcs_info_wrapper() {
      vcs_info
      if [ -n "$vcs_info_msg_0_" ]; then
        echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
      fi
    }

    # python virtualenv
    function virtualenv_info { [ $VIRTUAL_ENV ] && echo "%F{4}(${VIRTUAL_ENV##*/})%f " }

    # prompt
    autoload -U promptinit
    if [ $(hostname) = 'servak' ]
    then
        promptinit; prompt adam2 red
    elif [ $(hostname) = 'artstation' ]
    then
        promptinit; prompt adam2 cyan
    elif [ $(hostname) = 'blackbox' ]
    then
        promptinit; prompt adam2 blue
    else
        promptinit; prompt adam2 cyan
    fi
    setopt PROMPT_SUBST
    p_rc="%(?..[%?%1v])"
    RPROMPT='$p_rc $(virtualenv_info)% $(vcs_info_wrapper)% %T'
fi

preexec()
{
    if [[ "$TERM" =~ xterm.* ]] || [[ "$TERM" =~ screen.* ]]
    then
	    print -Pn "\e]0;%n@%m: "
	    echo -n $2
	    print -n "\a"
        ## screen
        if [[ "$TERM" =~ screen.* ]]
        then
            local name=$2
            if [ "$(echo $name | wc -c)" -gt 16 ]
            then
                name="$(echo $name | head -c 14).."
            fi
            print -Pn '\033k'$name'\033\\'
        fi
        ## end screen
    fi
}

precmd ()
{
    setopt noxtrace localoptions
    local exitstatus=$1
    [[ $exitstatus -ge 128 ]] && psvar[1]=" $signals[$exitstatus-127]" ||
	psvar[1]=""
    if [[ "$TERM" =~ xterm.* ]] || [[ "$TERM" =~ screen.* ]]
    then
        print -Pn "\e]0;%n@%m: %~\a"
        ## screen
        if [[ "$TERM" =~ screen.* ]]
        then
            local name=$(basename $(pwd))
            print -Pn '\033k'$name\\\$'\033\\'
        fi
        ## screen end
    fi
    which prompt_adam2_precmd &>> /dev/null && prompt_adam2_precmd; setopt promptsubst # prompt

}

#exec 2>>(while read line; do
#  print '\e[93m'${(q)line}'\e[0m' > /dev/tty; print -n $'\0'; done &)


# This script prints a bell character when a command finishes
# if it has been running for longer than $zbell_duration seconds.
# If there are programs that you know run long that you don't
# want to bell after, then add them to $zbell_ignore.
#
# This script uses only zsh builtins so its fast, there's no needless
# forking, and its only dependency is zsh and its standard modules
#
# Written by Jean-Philippe Ouellet <jpo@vt.edu>
# Made available under the ISC license.

# only do this if we're in an interactive shell
[[ -o interactive ]] || return

# get $EPOCHSECONDS. builtins are faster than date(1)
zmodload zsh/datetime || return

# make sure we can register hooks
autoload -Uz add-zsh-hook || return

# initialize zbell_duration if not set
(( ${+zbell_duration} )) || zbell_duration=15

# initialize zbell_ignore if not set
(( ${+zbell_ignore} )) || zbell_ignore=($EDITOR $PAGER)

# initialize it because otherwise we compare a date and an empty string
# the first time we see the prompt. it's fine to have lastcmd empty on the
# initial run because it evaluates to an empty string, and splitting an
# empty string just results in an empty array.
zbell_timestamp=$EPOCHSECONDS

# right before we begin to execute something, store the time it started at
zbell_begin() {
	zbell_timestamp=$EPOCHSECONDS
	zbell_lastcmd=$1
}

# when it finishes, if it's been running longer than $zbell_duration,
# and we dont have an ignored command in the line, then print a bell.
zbell_end() {
	ran_long=$(( $EPOCHSECONDS - $zbell_timestamp >= $zbell_duration ))

	has_ignored_cmd=0
	for cmd in ${(s:;:)zbell_lastcmd//|/;}; do
		words=(${(z)cmd})
		util=${words[1]}
		if (( ${zbell_ignore[(i)$util]} <= ${#zbell_ignore} )); then
			has_ignored_cmd=1
			break
		fi
	done

	if (( ! $has_ignored_cmd )) && (( ran_long )); then
		print -n "\a"
	fi
}

# register the functions as hooks
add-zsh-hook preexec zbell_begin
add-zsh-hook precmd zbell_end

function welcome() {
    last -w3 $whami | head -n 3
    have_a_mail=$(echo quit | mail 2> /dev/null | sed -n 's/.*: \([0-9]* messages*\).*/\1/p')
    if [ ! -z "$have_a_mail" ]
    then
        RED='\033[1;31m'
        NC='\033[0m' # No Color
        printf "${RED}You have $have_a_mail${NC}\n"
    fi
}
welcome
unfunction welcome
