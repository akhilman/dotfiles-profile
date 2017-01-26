###
# Setting title for XTerm and screen
##

function fish_title
    if [ $_ = 'fish' ]
        set title (prompt_pwd)
        if [ (echo -m "$title" | wc -c) -gt 15 ]
            set title (echo "$title" | tail -c 13)..
        end
    else
        set title "$argv"
        if [ (echo -m "$title" | wc -c) -gt 15 ]
            set title (echo "$title" | head -c 13)..
        end
    end
    if echo $TERM | grep -q "^screen.*"
        echo -e \033k$title\033\\
    else
        echo -e $title
    end
end
