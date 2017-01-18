#!/usr/bin/fish

###
# Aliases
##

# wttr.in
function wttr
    if [ -z $argv ]
        set place kemerovo
    else
        set place $argv[1]
    end
    curl wttr.in/$place | less -R
end

# tmux
function tmx
    if [ -z $argv ]
        set session main
    else
        set session $argv[1]
    end
    cd ~
    tmux new-session -A -s $session
end
alias tmless="tmux capture-pane -S -; and tmux save-buffer - | less"

# stuff
alias trm=trash
alias ls="ls --color=auto"


###
# Welcome
##

# welcome
function fish_greeting;
    last -w3 $whami | head -n 3;
    set have_a_mail (echo quit | mail 2> /dev/null | sed -n 's/.*: \([0-9]* messages*\).*/\1/p')
    if [ ! -z "$have_a_mail"  ]
        set color red
        printf "You have $have_a_mail\n"
        set color normal
    end
end
funcsave fish_greeting


###
# Bell and execution time
##

function postexec_execution_time --on-event fish_postexec
    if test -n "$CMD_DURATION" -a "$CMD_DURATION" -gt 10000
        # printf \a  # seems like fish bells by default
        set_color blue
        set h (math "$CMD_DURATION / 1000 / 60 / 60")
        set m (math "$CMD_DURATION  / 1000 / 60 % 60")
        set s (math "$CMD_DURATION / 1000 % 60")
        printf "Execution time:"
        if [ $h -gt 0 ]
            printf " %dh" $h
        end
        if [ $m -gt 0 ]
            printf " %dm" $m
        end
        printf " %ds\n" $s
        set_color normal
    end
end


###
# Setting title for XTerm and screen
##

function fish_title
    if [ $_ = 'fish' ]
        set title (prompt_pwd)
    else
        set title $_
    end
    echo -e $title
    if [ $TERM = screen ]
        echo -e \033k$title\033\\
    end
end
funcsave fish_title

#
###
# Powerline
##
if status --is-interactive
 		and [ "$COLORTERM" = "truecolor" ]
		and [ -e /usr/share/powerline/fish/powerline-setup.fish ]
	. /usr/share/powerline/fish/powerline-setup.fish
	powerline-setup
end

