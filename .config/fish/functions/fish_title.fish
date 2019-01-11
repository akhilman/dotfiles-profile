###
# Setting title for XTerm
##

function fish_title

    set -l title

    if [ $_ = 'fish' ]
        set title (prompt_pwd)
        if [ (echo -m "$title" | wc -c) -gt 15 ]
            set title ..(echo "$title" | tail -c 13)
        end
    else
        set title "$argv"
        if [ (echo -m "$title" | wc -c) -gt 15 ]
            set title (echo "$title" | head -c 13)..
        end
    end

    echo $title

end
