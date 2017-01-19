###
# Setting title for XTerm and screen
##

function fish_title
    if [ $_ = 'fish' ]
        set title (prompt_pwd)
        if [ (echo -m "$title" | wc -c) -gt 20 ]
            set title (echo "$title" | tail -c 18)..
        end
    else
        set title "$argv"
        if [ (echo -m "$title" | wc -c) -gt 20 ]
            set title (echo "$title" | head -c 18)..
        end
    end
    if echo $TERM | grep -q "^screen.*"
        echo -e \033k$title\033\\
    else
        echo -e $title
    end
end
