###
# Setting title for screen and tmux
###

function __fish_tmux_title_on_prompt --on-event fish_prompt

    [ -n $TMUX_PANE ]
    or return

    set -l title

    set title (prompt_pwd)
    if [ (string length "$title") -gt 15 ]
        set title ..(string sub -s -13 "$title")
    end

    tmux rename-window -t $TMUX_PANE $title

end


function __fish_tmux_title_on_preexec --on-event fish_preexec

    [ -n $TMUX_PANE ]
    or return

    set -l title

    set title "$argv"
    if [ (string length "$title") -gt 15 ]
        set title (string sub -l 13 "$title")..
    end

    tmux rename-window -t $TMUX_PANE $title

end
