###
# Setting title for XTerm and screen
##

function fish_title
    if [ $_ = 'fish' ]
        set title (prompt_pwd)
        if [ (string length "$title") -gt 20 ]
            set title (echo "$title" | tail -c 18)..
        end
    else
        set title "$argv"
        if [ (string length "$title") -gt 20 ]
            set title (echo "$title" | head -c 18)..
        end
    end
    if string match -r "screen.*" $TERM > /dev/null
        echo -e \033k$title\033\\
    else
        echo -e $title
    end
end
