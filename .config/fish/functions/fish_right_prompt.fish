function fish_right_prompt

    set -l vcs_pr
    set -l date_pr (date "+%F %R %A")

    if functions -q __fish_vcs_prompt
        set vcs_pr (__fish_vcs_prompt)
    end

    echo -sn (set_color grey) $date_pr (set_color cyan) $vcs_pr (set_color normal)

end
