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
