###
# Setting title for XTerm and screen
##

function fish_title
    if [ $_ = 'fish' ]
        set title (prompt_pwd)
    else
        set title $_
    end
    echo -e $title
    if [ $TERM = screen ]
        echo -e \033k$title\033\\
    end
end
