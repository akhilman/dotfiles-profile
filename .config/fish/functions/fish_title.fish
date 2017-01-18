function fish_title \
--description="Setting title for XTerm and screen"
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
