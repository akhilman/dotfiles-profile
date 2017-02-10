###
# Setting title for screen and tmux
###

function __fish_tmux_title_on_prompt --on-event fish_prompt

    echo $TERM | grep -q "^screen.*"
    or return

    set -l title

    set title (prompt_pwd)
    if [ (echo -m "$title" | wc -c) -gt 15 ]
        set title (echo "$title" | tail -c 13)..
    end

    echo -ne \033k$title\033\\

end


function __fish_tmux_title_on_preexec --on-event fish_preexec

    echo $TERM | grep -q "^screen.*"
    or return

    set -l title

    set title "$argv"
    if [ (echo -m "$title" | wc -c) -gt 15 ]
        set title (echo "$title" | head -c 13)..
    end

    echo -ne \033k$title\033\\

end
