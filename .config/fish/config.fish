#!/usr/bin/fish

###
# Aliases
##

# wttr.in
function wttr \
--argument-names 'place' \
--description 'Show weather'
    if [ -z $place ]
        set place kemerovo
    end
    curl wttr.in/$place | less -R
end

# tmux
function tmx \
--argument-names 'session' \
--description 'Create or attach to tmux sesssion'
    if [ -z $session ]
        set session main
    end
    cd ~
    tmux new-session -A -s $session
end

function tmless \
--description 'Show tmux log in pager'
    tmux capture-pane -S
        and tmux save-buffer - | less
end

# stuff
function trm \
--description 'Move files to trash'
    count $argv > /dev/null
        or return
    trash $argv
end

function ls \
--description 'List contents of directory'
    command ls --color=auto $argv
end


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
# Powerline
##
if status --is-interactive
 		and [ "$COLORTERM" = "truecolor" ]
		and [ -e /usr/share/powerline/fish/powerline-setup.fish ]
	. /usr/share/powerline/fish/powerline-setup.fish
	powerline-setup
end
