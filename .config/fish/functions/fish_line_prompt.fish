###
# Bell and execution time
##

function fish_line_prompt

	set -l last_status $status
    set -l prompt_duration
    set -l prompt_date
    set -l prompt_line
    set -qU fish_color_status; or set -U fish_color_status red
    set -qU fish_color_host; or set -U fish_color_host -o cyan

	if test $last_status -ne 0
		set prompt_status " [$last_status] "
	end

    if test -n "$CMD_DURATION" -a "$CMD_DURATION" -gt 10000
        # printf \a  # seems like fish bells by default

        set -l h (math "$CMD_DURATION / 1000 / 60 / 60")
        set -l m (math "$CMD_DURATION  / 1000 / 60 % 60")
        set -l s (math "$CMD_DURATION / 1000 % 60")
        if [ $h -gt 0 ]
            set prompt_duration $prompt_duration " " $h"h"
        end
        if [ $m -gt 0 ]
            set prompt_duration $prompt_duration " " $m"m"
        end
        set prompt_duration $prompt_duration " " $s"s"
        set prompt_duration " " "Execution time:" $prompt_duration
    end

    set prompt_date " " (date "+%F %R %A") " "

    set prompt_left "-" $prompt_status "-" $prompt_duration "-"
    set prompt_right "-" $prompt_date "-"

    set -l line_len (math $COLUMNS - (echo -sn $prompt_left $prompt_right | wc -m))
    if [ $line_len -gt 0 ]
        set prompt_line (printf '%*s' $line_len | tr ' ' '-')
    end

    set prompt_left (set_color $fish_color_host) "-" (set_color $fish_color_status) $prompt_status (set_color $fish_color_host) "-" $prompt_duration "-"
    set prompt_right "-" $prompt_date "-"  (set_color normal)

    echo -sn $prompt_left $prompt_line $prompt_right

end
